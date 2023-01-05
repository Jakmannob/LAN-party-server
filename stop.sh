#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

./resolve-interface.sh
IFACE=$(cat interface.txt)
echo $IFACE

function terminate_DHCP {
    echo "Killing DHCP server"
    systemctl stop dhcpd4
    echo "Setting down $IFACE"
    ip link set dev $IFACE down
    echo "Removing IP address of down $IFACE"
    ip a del 10.0.0.1/24 dev $IFACE
    echo "Restoring DHCP configuration"
    mv /etc/dhcpd.conf.bak /etc/dhcpd.conf
    echo "Terminated DHCP"
}

function terminate_murmur {
    echo "Killing mumble server"
    systemctl stop murmur
    echo "Restoring murmur configuration"
    mv /etc/murmur.ini.bak /etc/murmur.ini
    echo "Terminated mumble server"
}

function terminate_samba {
    echo "Killing smb daemon"
    systemctl stop smb.service
    echo "Killing nmb daemon"
    systemctl stop nmb.service
    echo "Killing wsdd daemon"
    systemctl stop wsdd.service
    echo "Killing avahi daemon"
    systemctl stop avahi-daemon.service
    
    echo "Restoring old samba configuration"
    cp /etc/samba/smb.conf.bak /etc/samba/smb.conf
    echo "Terminated SMB share"
}


terminate_DHCP
echo ""
terminate_murmur
echo ""
terminate_samba
echo ""
echo "LAN party server fully shut down"
