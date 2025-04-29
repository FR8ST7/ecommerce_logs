#!/bin/bash

# Define the theme-related directory
THEME_DIR="ecommerce_logs"

# Check if the directory exists
if [[ ! -d "$THEME_DIR" ]]; then
    echo "Error: Directory $THEME_DIR does not exist."
    exit 1
fi

# Use an associative array to store file hashes
declare -A file_hashes

echo "Scanning for duplicate files in $THEME_DIR..."
echo "-----------------------------------------------"

# Find all files and compute their hashes
find "$THEME_DIR" -type f | while read -r file; do
    hash=$(md5sum "$file" | awk '{print $1}')
    
    # Check if this hash already exists
    if [[ -n "${file_hashes[$hash]}" ]]; then
        echo "Duplicate found: $file (Same as ${file_hashes[$hash]})"
        rm "$file"
        echo "Deleted: $file"
    else
        file_hashes[$hash]="$file"
    fi
done

echo "-----------------------------------------------"
echo "Duplicate removal process completed."

