#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update   # For Debian-based systems
# sudo yum check-update   # For older Red Hat-based systems
# sudo dnf check-update   # For newer Red Hat-based systems

# Upgrade all packages
echo "Upgrading packages..."
sudo apt upgrade -y   # For Debian-based systems
# sudo yum update -y   # For older Red Hat-based systems
# sudo dnf upgrade -y   # For newer Red Hat-based systems

echo "Packages updated successfully."