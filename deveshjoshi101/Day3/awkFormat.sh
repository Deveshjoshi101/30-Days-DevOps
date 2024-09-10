#!/bin/bash
# Script to format and summarize data using awk

file="data.txt"

# Print the formatted data
awk -F, '{printf "Name: %s, Age: %d, Occupation: %s\n", $1, $2, $3}' "$file"

# Calculate and print the average age
awk -F, '{sum += $2; count++} END {print "Average Age: " sum/count}' "$file"