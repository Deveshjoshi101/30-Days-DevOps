#!/bin/bash
# Script demonstrating the use of functions

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        echo "Directory $1 exists."
    else
        echo "Directory $1 does not exist."
    fi
}

# Function to calculate factorial
factorial() {
    if [ $1 -le 1 ]; then
        echo 1
    else
        prev=$(factorial $(($1 - 1)))
        echo $(($1 * $prev))
    fi
}

# Call functions
check_directory "../Day5"
echo "Factorial of 6: $(factorial 6)"