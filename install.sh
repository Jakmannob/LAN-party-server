#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

# Installer, written for Arch Linux
pacman -Syu dhcp murmur
