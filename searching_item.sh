#!/bin/bash

# Prompt user for file path and keyword
read -p "Enter the path of the file to search in: " file_path
read -p "Enter the keyword to search for: " keyword

# Check if file exists
if [[ ! -f "$file_path" ]]; then
    echo "Error: File $file_path not found."
    exit 1
fi

# Search for the keyword in the file and display the product details
awk -v kw="$keyword" '
    BEGIN { RS="------------------------------------------" }
    tolower($0) ~ tolower(kw) { print $0; found=1 }
    END { if (!found) print "No matching product found." }
' "$file_path"

