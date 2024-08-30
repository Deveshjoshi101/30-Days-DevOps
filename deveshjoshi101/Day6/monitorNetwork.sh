#!/bin/bash
# Script to monitor network connectivity

host="google.com"
log_file="network_status.log"

while true; do
    if ping -c 1 $host &>/dev/null; then
        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$timestamp: $host is reachable."
        echo "$timestamp: $host is reachable." >> $log_file
    else
        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$timestamp: $host is not reachable."
        echo "$timestamp: $host is not reachable." >> $log_file
    fi
    sleep 5
done
