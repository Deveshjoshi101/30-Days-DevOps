#!/bin/bash
# Script to search and replace text in files

if [ $# -ne 3 ]; then
    echo "Usage: $0 <search_text> <replace_text> <directory>"
    exit 1
fi

search_text=$1
replace_text=$2
directory=$3

# Find and replace text in all files within the specified directory
for file in "$directory"/*; do
    if [ -f "$file" ]; then
        sed -i "s/$search_text/$replace_text/g" "$file"
        echo "Replaced '$search_text' with '$replace_text' in $file"
    fi
done