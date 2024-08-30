#!/bin/bash
# Script to monitor system resource usage

# Display CPU usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
awk '{print 100 - $1"%"}'

# Display Memory usage
echo "Memory Usage:"
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Display Disk usage
echo "Disk Usage:"
df -h | grep -E '^/dev/root' | awk '{ print $5 " (" $1 ")" }'

# Display top 5 processes by memory usage
echo "Top 5 processes by memory usage:"
ps aux --sort=-%mem | awk 'NR<=5{printf "%-10s %-10s %-10s %-10s %-10s\n", $1, $2, $3, $4, $11}'