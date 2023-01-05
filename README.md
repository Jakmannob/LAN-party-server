# LAN-party-server

A linux server that provides DHCP, voicechat and file-download for an offline LAN-party

## Requirements for the server

Currently, the server has to be running **Arch Linux**, with no firewall.
If a firewall is active on the server, please open TCP and UDP ports:

- `64738` for mumble
- `137, 138, 139, 445` for samba

## Managing the mumble server

Once the mumble server is started, do the following as a client:

1. Start your mumble client
2. Create a mumble certificate using the certificate wizard
3. Join the server at `10.0.0.1` (or by hostname of the LAN party server)
4. Register your user at the server
5. Disconnect from the server
6. Reconnect to the server, but with username `SuperUser`
7. If asked, enter the password (default: `dpsgkissinglanparty`) and connect

## TODO

- Add needed AUR packages to installer
- Also, a user named `server` with passwd `lan` has to be created
- Also, a user named `player` with passwd `lan` has to be created on the server to access SMB shares
- Create +rw folders /home/server/Tmp and /home/server/Installer
