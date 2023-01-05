#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

echo "Backing up old samba configuration"
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
echo "Saving new samba configuration"
cp smb.conf /etc/samba/smb.conf

echo "Starting smb service"
systemctl start smb.service
echo "Starting nmb service"
systemctl start nmb.service
echo "Starting wsdd service"
systemctl start wsdd.service
echo "Starting avahi service"
systemctl start avahi-daemon.service
