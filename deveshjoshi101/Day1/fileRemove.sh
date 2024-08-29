#!/bin/bash

# Delete the created files
for i in {1..5}; do
    rm "file_$i.txt"
    echo "Deleted file_$i.txt"
done
