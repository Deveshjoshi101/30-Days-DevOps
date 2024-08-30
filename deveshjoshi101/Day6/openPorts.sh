#!/bin/bash
# Script to check open ports

echo "Open ports on $(hostname):"
sudo netstat -tuln | grep LISTEN