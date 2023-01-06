#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

/home/server/Server/LAN-party-server/resolve-interface.sh
IFACE=$(cat /home/server/Server/LAN-party-server/interface.txt)

echo "Setting up interface $IFACE"
ip link set up dev $IFACE
ip addr add 10.0.0.1/24 dev $IFACE
echo "Interface $IFACE set up with IP address 10.0.0.1"

echo "Backing up DHCP configuration"
mv /etc/dhcpd.conf /etc/dhcpd.conf.bak
echo "Setting up new DHCP configuration"
echo "subnet 10.0.0.0 netmask 255.255.255.0 {
    range 10.0.0.10 10.0.0.250;
}" > /etc/dhcpd.conf

echo "Starting DHCP server"
systemctl start dhcpd4
