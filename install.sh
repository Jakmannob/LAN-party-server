#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

# Installer, written for Arch Linux
pacman -Syu dhcp murmur samba avahi

echo ""
echo "Setting up directories"
mkdir ~/Installer
mkdir ~/Tmp

echo "Setting up MotD"
cp motd.txt ~

echo "Setting up shell"
cp .zshrc ~
source ~/.zshrc
