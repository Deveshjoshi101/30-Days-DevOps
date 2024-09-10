#!/bin/bash
# Script to check if a file exists and delete it

read -p "Enter the filename to delete: " filename

if [ -e "$filename" ]; then
    rm "$filename"
    echo "File $filename deleted successfully."
else
    echo "File $filename does not exist."
fi