#!/bin/bash
# Script with error handling

file_to_delete=$1

if [ ! -e "$file_to_delete" ]; then
    echo "Error: File $file_to_delete does not exist."
    exit 1
fi

if rm "$file_to_delete"; then
    echo "File $file_to_delete deleted successfully."
else
    echo "Error: Could not delete $file_to_delete."
    exit 1
fi