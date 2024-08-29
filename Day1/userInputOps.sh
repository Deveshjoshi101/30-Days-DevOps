#!/bin/bash
# Script to take user input and perform operations

echo "Please enter your name:"
read name

echo "Hello, $name! What would you like to do?"
echo "1. Create a file"
echo "2. Delete a file"
echo "3. Exit"
read -p "Enter your choice (1/2/3): " choice

case $choice in
    1)
        read -p "Enter the filename to create: " filename
        touch "$filename"
        echo "File $filename created."
        ;;
    2)
        read -p "Enter the filename to delete: " filename
        if [ -e "$filename" ]; then
            rm "$filename"
            echo "File $filename deleted."
        else
            echo "File $filename does not exist."
        fi
        ;;
    3)
        echo "Exiting the script. Bye!"
        ;;
    *)
        echo "Invalid choice. Please run the script again."
        ;;
esac