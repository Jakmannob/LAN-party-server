#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

/home/server/Server/LAN-party-server/dhcp-server.sh
echo ""
/home/server/Server/LAN-party-server/mumble-server.sh
echo ""
/home/server/Server/LAN-party-server/smb.sh
echo ""
echo "LAN party server fully started"
