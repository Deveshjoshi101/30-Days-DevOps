#!/bin/bash
# Script to automate development environment setup

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install essential development tools
sudo apt-get install -y git vim curl build-essential

# Install programming languages (example: Python and Node.js)
sudo apt-get install -y python3 python3-pip nodejs npm

# Set up Git configuration
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Create a directory structure for projects
mkdir -p ~/projects/{python,nodejs}

echo "Development environment setup complete."