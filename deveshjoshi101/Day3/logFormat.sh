#!/bin/bash
# Script to summarize log file data

logfile="logfile.log"

# Count the number of each log level
echo "Log Level Summary:"
awk '{print $3}' "$logfile" | sort | uniq -c

# Extract and print the number of ERROR and WARN logs
echo "Error and Warning Logs:"
grep -E "ERROR|WARN" "$logfile"

# Count the number of log entries per hour
echo "Log Entries per Hour:"
awk '{print substr($2, 1, 2)}' "$logfile" | sort | uniq -c