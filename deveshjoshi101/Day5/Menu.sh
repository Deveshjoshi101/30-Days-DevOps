#!/bin/bash
# Menu-driven interface example

while true; do
    echo "Main Menu:"
    echo "1. Display Date and Time"
    echo "2. List Files in Current Directory"
    echo "3. Check Disk Usage"
    echo "4. Exit"
    echo -n "Enter your choice: "
    read choice

    case $choice in
        1) echo "Date and Time: $(date)" ;;
        2) echo "Files in $(pwd):" && ls ;;
        3) echo "Disk Usage:" && df -h ;;
        4) echo "Exiting..." && exit 0 ;;
        *) echo "Invalid choice, please try again." ;;
    esac
    echo ""
done