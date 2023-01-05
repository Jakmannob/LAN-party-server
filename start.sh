#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

./dhcp-server.sh
echo ""
./mumble-server.sh
echo ""
./smb.sh
echo ""
echo "LAN party server fully started"
