#!/bin/bash
# Script to fetch data from a web page

url="https://www.example.com"
output_file="webpage_content.html"

curl -o $output_file $url

echo "Data fetched from $url and saved to $output_file."