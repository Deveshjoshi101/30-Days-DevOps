#!/bin/bash

# Loop to create folders from Day1 to Day30 and add corresponding .md files
for i in {1..30}; do
  folder="Day$i"
  mkdir "$folder"                 # Create the folder
  file="$folder/Day-$i-Tasks.md"  # Define the file name
  touch "$file"                   # Create the .md file
  echo "Created folder: $folder and file: $file"
done
