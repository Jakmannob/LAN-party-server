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
    echo ""
}

terminate_DHCP
echo "LAN party server fully shut down"
