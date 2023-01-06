#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Please run as root."
    exit 1
fi

echo "Saving previous murmur configuration"
mv /etc/murmur.ini /etc/murmur.ini.bak
echo "Setting new murmur configuration"
cp /home/server/Server/LAN-party-server/murmur.ini /etc/murmur.ini

# I know, I've leaked the password, but if you've made it this far, you can have
# it, no hard feelings
SUPERPASS="dpsgkissinglanparty"
echo "Setting supervisor password to $SUPERPASS"
sudo -H -u murmur murmurd -ini /etc/murmur.ini -supw $SUPERPASS

echo "Starting mumble server"
systemctl start murmur
