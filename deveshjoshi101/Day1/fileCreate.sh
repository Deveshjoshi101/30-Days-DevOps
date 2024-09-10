#!/bin/bash

# Create 5 files with a loop
for i in {1..5}; do
    touch "file_$i.txt"
    echo "Created file_$i.txt"
done
