#!/bin/bash
# Script to list all files in a directory

directory=$1

for file in "$directory"/*; do
    if [ -f "$file" ]; then
        echo "File: $file"
    fi
done