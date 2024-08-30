#!/bin/bash
# Script to batch rename files with a specified prefix
# example : bash rename_files.sh ./rename example

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
        # Get the base name and extension separately
        base_name=$(basename "$file")
        extension="${base_name##*.}"
        
        # Check if the file has an extension
        if [ "$base_name" == "$extension" ]; then
            # No extension
            new_name="${prefix}_${counter}"
        else
            # Has extension
            new_name="${prefix}_${counter}.${extension}"
        fi

        # Rename the file
        mv "$file" "$directory/$new_name"
        echo "Renamed $file to $new_name"
        ((counter++))
    fi
done
