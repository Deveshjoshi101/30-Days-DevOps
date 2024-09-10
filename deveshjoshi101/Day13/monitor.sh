#!/bin/bash

# Define threshold (e.g., 80%)
THRESHOLD=80

# Get the current disk usage percentage
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    # Send an alert (using mail command, configure for your mail server)
    echo "Disk usage is at ${USAGE}% on $(hostname)" | mail -s "Disk Usage Alert" deveshjoshi101@gmail.com
fi