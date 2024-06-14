#!/bin/bash

# Script for automated patch management using apt (Ubuntu)
# Adjust package names and commands based on your distribution

# Update package lists
apt-get update

# Upgrade all packages
apt-get -y upgrade

# Install specific packages
apt-get -y install package1 package2

# Clean up unnecessary packages
apt-get autoremove --purge

# Reboot if required
if [ -f /var/run/reboot-required ]; then
    echo 'Rebooting system...'
    reboot
fi
