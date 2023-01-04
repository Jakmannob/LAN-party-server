#!/bin/bash

./resolve-interface.sh
IFACE=$(cat interface.txt)
echo $IFACE

function terminate_DHCP {
    echo "Killing DHCP server"
    systemctl stop dhcpd4
    echo "Setting down $IFACE"
    ip link set dev $IFACE down
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


terminate_DHCP
echo ""
terminate_murmur
echo ""
echo "LAN party server fully shut down"
