#!/bin/bash

# Update package list
sudo apt update

# Upgrade all installed packages
sudo apt upgrade -y

# Clean up obsolete packages
sudo apt autoremove -y

# Provide feedback
echo "System updates and upgrades completed."