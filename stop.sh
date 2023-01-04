#!/bin/bash

./resolve-interface.sh
IFACE=$(cat interface.txt)
echo $IFACE

function terminate_DHCP {
    echo "Killing DHCP server"
    systemctl stop dhcpcd
    echo "Setting down $IFACE"
    ip link set dev $IFACE down
    echo "Restoring DHCP configuration"
    mv /etc/dhcpd.conf /etc/dhcpd.conf.bak
    echo "Terminated DHCP"
    echo ""
}

terminate_DHCP
echo "LAN party server fully shut down"
