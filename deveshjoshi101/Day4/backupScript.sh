#!/bin/bash
# Script to back up a directory

# Directory to back up
source_dir="./source"
# Backup destination
backup_dir="./backup"
# Create a timestamp
timestamp=$(date +"%Y%m%d_%H%M%S")
# Create a backup file name
backup_file="backup_$timestamp.tar.gz"

# Perform the backup using tar
tar -czf "$backup_dir/$backup_file" "$source_dir"

echo "Backup of $source_dir completed successfully."
echo "Backup saved as $backup_dir/$backup_file"