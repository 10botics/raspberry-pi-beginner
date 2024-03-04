#!/bin/bash

# Get the MAC address of the wlan0 interface
MAC_ADDRESS=$(cat /sys/class/net/wlan0/address)

# Remove colons from the MAC address
MAC_ADDRESS_NO_COLONS=$(echo "$MAC_ADDRESS" | sed 's/://g')

# Extract the last 6 characters
HOSTNAME_SUFFIX=${MAC_ADDRESS_NO_COLONS: -6}

echo $HOSTNAME_SUFFIX

# Set the hostname
hostnamectl set-hostname "${HOSTNAME_SUFFIX}"

# Disable the systemd service so it doesn't run again on reboot
systemctl disable set-hostname-from-mac.service