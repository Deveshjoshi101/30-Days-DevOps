#!/bin/bash

# Function to create a user
create_user() {
    echo -n "Enter username to create: "
    read username
    sudo useradd -m "$username"
    sudo passwd "$username"
    echo "User $username created successfully."
}

# Function to delete a user
delete_user() {
    echo -n "Enter username to delete: "
    read username
    sudo userdel -r "$username"
    echo "User $username deleted successfully."
}

# Function to modify a user's privileges
modify_privileges() {
    echo -n "Enter username to modify: "
    read username
    sudo usermod -aG sudo "$username"
    echo "User $username has been granted sudo privileges."
}

# Function to change file permissions
change_permissions() {
    echo -n "Enter file name: "
    read filename
    echo -n "Enter permissions (e.g., 755): "
    read permissions
    chmod "$permissions" "$filename"
    echo "Permissions for $filename changed to $permissions."
}

# Main menu
while true; do
    echo "User and Permission Management Script"
    echo "1. Create User"
    echo "2. Delete User"
    echo "3. Modify User Privileges"
    echo "4. Change File Permissions"
    echo "5. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) create_user ;;
        2) delete_user ;;
        3) modify_privileges ;;
        4) change_permissions ;;
        5) exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo ""
done