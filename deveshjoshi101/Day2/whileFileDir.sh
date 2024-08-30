#!/bin/bash
# Script to process files using a while loop

directory=$1
file_list=$(ls "$directory")
counter=1

while [ $counter -le $(echo "$file_list" | wc -l) ]; do
    file=$(echo "$file_list" | sed -n "${counter}p")
    echo "Processing file: $file"
    ((counter++))
done