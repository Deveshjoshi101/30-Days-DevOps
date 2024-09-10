#!/bin/bash
# Script to summarize log file data

logfile="logfile.log"

# Count the number of each log level
echo "Log Level Summary:"
awk '$3 ~ /^(INFO|ERROR|WARN)$/ {print $3}' "$logfile" | sort | uniq -c
echo

# Extract and print the number of ERROR and WARN logs
echo "Error and Warning Logs:"
grep -E "ERROR|WARN" "$logfile"
echo
# awk '$3 == "ERROR" || $3 == "WARN" { for (i=4; i<=NF; i++) printf "%s ", $i; printf "\n" }' "$logfile"
# echo

awk '
    $3 == "ERROR" || $3 == "WARN" {
        hour = substr($2, 1, 2)
        messages[hour] = messages[hour] (messages[hour] ? "\n" : "") (substr($0, index($0, $4)))
    }
    END {
        for (h in messages) {
            printf "For %sth hour:\n%s\n", h, messages[h]
        }
    }
' "$logfile"
echo

# Count the number of log entries per hour
echo "Log Entries per Hour:"
awk '{print substr($2, 1, 2)}' "$logfile" | sort | uniq -c | awk '$2 !~ /^$/ {printf "%d for %sth hour,\n", $1, $2}' | sed '$s/,$//'
echo


