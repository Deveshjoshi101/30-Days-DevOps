#!/bin/bash
# This script checks to monitor the CPU usage of running processes on your system and
# automatically terminates any processes that exceed a specified CPU usage threshold.

# Define the CPU usage threshold (in %)
CPU_THRESHOLD=80

# Define a log file to store monitoring information
LOG_FILE="./log/cpu_monitor.log"

# Function to log messages
log_message() {
    local message="$1"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Check if bc is installed
if ! command -v bc &> /dev/null; then
    log_message "Error: 'bc' is not installed. Please install it and rerun the script."
    exit 1
fi

# Log the start of the monitoring script
log_message "Starting CPU usage monitoring. Threshold set at ${CPU_THRESHOLD}%."

# Monitor and kill processes exceeding the CPU threshold
while true; do
    # List processes sorted by CPU usage, excluding the header and this script
    ps -eo pid,%cpu,comm --sort=-%cpu | awk 'NR>1' | grep -v "$0" | while read -r pid cpu command; do
        # Check if the CPU usage exceeds the threshold
        if (( $(echo "$cpu > $CPU_THRESHOLD" | bc -l) )); then
            log_message "Process $command (PID: $pid) is using $cpu% CPU. Killing it."
            # Attempt to kill the process and log the outcome
            if kill -9 "$pid" 2>/dev/null; then
                log_message "Successfully killed process $command (PID: $pid)."
            else
                log_message "Failed to kill process $command (PID: $pid). It may have already exited or permissions are insufficient."
            fi
        fi
    done
    sleep 10
done
