#!/bin/bash

# Check if sufficient arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 username password"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

# Create the user with the specified username
sudo useradd -m $USERNAME

# Set the user's password
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# Provide feedback
echo "User $USERNAME created and password set."