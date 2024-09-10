#!/bin/bash
# Script to check the status of a service
# example bash serviceStatus.sh sshd

service_name="$1"

if systemctl is-active --quiet "$service_name"; then
    echo "The service $service_name is running."
else
    echo "The service $service_name is not running."
fi