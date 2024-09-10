#!/bin/bash
# Script to check website status

url="https://www.example.com"
log_file="website_status.log"

status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $url)

if [ $status_code -eq 200 ]; then
    echo "$(date): $url is up. Status code: $status_code" >> $log_file
else
    echo "$(date): $url is down. Status code: $status_code" >> $log_file
fi