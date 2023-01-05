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
sudo mkdir /home/player/Installer
sudo chmod 666 /home/player/Installer
sudo mkdir /home/player/Installer
sudo chmod 666 /home/player/Installer

echo "Setting up MotD"
cp motd.txt /home/server

echo "Setting up shell"
cp .zshrc /home/server
source /home/server/.zshrc
