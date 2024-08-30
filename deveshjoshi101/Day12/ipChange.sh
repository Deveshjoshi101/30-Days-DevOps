#!/bin/bash

# Define network interface and IP address
INTERFACE="eth0"
IP_ADDRESS="192.168.1.100/24"
GATEWAY="192.168.1.1"

# Configure the network interface
echo "Configuring network interface $INTERFACE..."

# Assign IP address
sudo ip addr add $IP_ADDRESS dev $INTERFACE

# Bring the interface up
sudo ip link set $INTERFACE up

# Set the default gateway
sudo ip route add default via $GATEWAY

echo "Network configuration applied successfully."