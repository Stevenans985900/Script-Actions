#!/bin/bash

# VPN AUTHENTICATION
# Scripts Actions app supports server-side OpenVPN mode. You can use the secret manager to attach
# a OVPN config file. The app will create automatically VPN connections for all your scripts.
# SSH AUTNENTICATION
# Please use app's secret manager to set your SSH private key

echo "You can access your DC via OVPN..."

if [ "$VPNKEY" != "" ]; then
    # Key is attached to your secret manager, we're waiting for some time for the VPN to be initiated.
    sleep 6
fi

# Pull last 100 lines of the system logs
ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null user@my.vpnaccessiblehost.com tail -100 /var/log/syslog
