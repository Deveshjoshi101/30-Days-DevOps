#!/bin/bash
# Script to automate system updates

# Update the package list
echo "Updating package list..."
sudo apt-get update -y

# Upgrade all installed packages
echo "Upgrading installed packages..."
sudo apt-get upgrade -y

# Perform a distribution upgrade
echo "Performing distribution upgrade..."
sudo apt-get dist-upgrade -y

# Clean up unnecessary packages and files
echo "Cleaning up unnecessary packages..."
sudo apt-get autoremove -y
sudo apt-get autoclean -y

echo "System update complete."