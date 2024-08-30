#!/bin/bash

# Define log directory and archive directory
LOG_DIR="/var/log"
ARCHIVE_DIR="/var/log/archive"
DATE=$(date +%F)

# Create archive directory if it doesn't exist
mkdir -p $ARCHIVE_DIR

# Archive old log files
for LOG_FILE in $(ls $LOG_DIR/*.log); do
    tar -czf $ARCHIVE_DIR/$(basename $LOG_FILE)-$DATE.tar.gz $LOG_FILE
    > $LOG_FILE
done

# Provide feedback
echo "Log files archived and rotated."