#!/bin/bash
# Script to manage user accounts

# Function to create a user
create_user() {
    if id "$1" &>/dev/null; then
        echo "User $1 already exists."
    else
        sudo useradd "$1"
        echo "User $1 created."
    fi
}

# Function to delete a user
delete_user() {
    if id "$1" &>/dev/null; then
        sudo userdel "$1"
        echo "User $1 deleted."
    else
        echo "User $1 does not exist."
    fi
}

# Main script logic
echo "User Management Script"
echo "1. Create User"
echo "2. Delete User"
echo -n "Choose an option: "
read option

echo -n "Enter username: "
read username

case $option in
    1) create_user "$username" ;;
    2) delete_user "$username" ;;
    *) echo "Invalid option" ;;
esac