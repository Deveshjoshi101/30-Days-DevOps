#!/bin/bash
# Script demonstrating the use of arrays

# Define an array of colors
colors=("red" "green" "blue" "yellow")

# Print all colors
echo "All colors: ${colors[@]}"

# Print the first color
echo "First color: ${colors[0]}"

# Add a new color to the array
colors+=("purple")
echo "Colors after adding purple: ${colors[@]}"

# Loop through the array
for color in "${colors[@]}"; do
    echo "Color: $color"
done