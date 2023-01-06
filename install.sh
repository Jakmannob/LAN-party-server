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
echo ""

echo "Setting up MotD"
cp /home/server/Server/LAN-party-server/motd.txt /home/server
echo ""

echo "Setting up shell"
cp /home/server/Server/LAN-party-server/.zshrc /home/server
source /home/server/.zshrc
echo ""

echo "Backing up old sshd config"
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
echo "Setting up new sshd config"
cp /home/server/Server/LAN-party-server/sshd_config /etc/ssh/
echo "Enabling sshd service"
systemctl enable sshd.service
echo "Starting sshd service"
systemctl start sshd.service
echo ""

echo "Configuring LAN-party service"
cp /home/server/Server/LAN-party-server/lan-party.service /etc/systemd/system/
echo "Enabling LAN-party service"
systemctl enable lan-party.service
echo "Starting LAN-party service"
systemctl start lan-party.service

