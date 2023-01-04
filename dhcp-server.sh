#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

./resolve-interface.sh
IFACE=$(cat interface.txt)

echo "Setting up interface $IFACE"
ip link set up dev $IFACE
ip addr add 10.0.0.1/24 dev $IFACE
echo "Interface $IFACE set up with IP address 10.0.0.1"

echo "Backing up DHCP configuration"
mv /etc/dhcpd.conf /etc/dhcpd.conf.bak
echo "Setting up new DHCP configuration"
echo "option domain-name-servers 10.0.0.1;
option subnet-mask 255.255.255.0;
option routers 10.0.0.1;
subnet 10.0.0.0 netmask 255.255.255.0 {
    range 10.0.0.10 10.0.0.250;
}" > /etc/dhcpd.conf

echo "Starting DHCP server"
systemctl start dhcpd4
