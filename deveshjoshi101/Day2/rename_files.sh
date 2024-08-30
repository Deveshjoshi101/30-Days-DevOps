#!/bin/bash
# Script to batch rename files with a specified prefix

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <prefix>"
    exit 1
fi

directory=$1
prefix=$2
counter=1

# Iterate over all files in the directory
for file in "$directory"/*; do
    # Check if it's a file
    if [ -f "$file" ]; then
        # Get the file extension
        extension="${file##*.}"
        # Construct the new file name
        new_name="${prefix}_${counter}.${extension}"
        # Rename the file
        mv "$file" "$directory/$new_name"
        echo "Renamed $file to $new_name"
        ((counter++))
    fi
done