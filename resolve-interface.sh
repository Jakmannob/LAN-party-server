#!/bin/bash

# Set this line to specify the interface manually, or save it to interface.txt
#IFACE="eth0"

if test -f "/home/server/Server/LAN-party-server/interface.txt"; then
    exit
fi

if [ -z "$IFACE" ]
then
    echo "No interface specified."
    echo "Resolving interface..."
    IFACE=$(ip -br l | awk '$1 !~ "lo|vir|wl" { print $1}')
    echo "Found interfaces:"
    echo $IFACE
    # Use this line to split by newline
    #IFACE=$(echo $IFACE | sed -n '1 p')
    # Use this line to split by spaces
    IFACE=$(echo $IFACE | cut -d' ' -f1)
    echo "Using interface '$IFACE'"
    echo "Please set the interface manually, if necessary."
    echo ""
else
    echo "Using preset interface $IFACE"
fi

echo $IFACE > /home/server/Server/LAN-party-server/interface.txt
