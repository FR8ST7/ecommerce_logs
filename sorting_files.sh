#!/bin/bash

# Define the directory to sort
THEME_DIR="ecommerce_logs"

# Define the output file
OUTPUT_FILE="sorted_files.txt"

# Prompt user for sorting preference
echo "Choose sorting option:"
echo "1. Sort by File Name"
echo "2. Sort by File Size"
read -p "Enter choice (1 or 2): " choice

# Check if the directory exists
if [[ ! -d "$THEME_DIR" ]]; then
    echo "Error: Directory $THEME_DIR does not exist."
    exit 1
fi

# Perform sorting based on user choice
if [[ "$choice" -eq 1 ]]; then
    echo "Sorting files by name..."
    find "$THEME_DIR" -type f | sort > "$OUTPUT_FILE"
elif [[ "$choice" -eq 2 ]]; then
    echo "Sorting files by size..."
    find "$THEME_DIR" -type f -exec ls -lh {} + | awk '{print $9, $5}' | sort -k2 -h > "$OUTPUT_FILE"
else
    echo "Invalid choice! Please enter 1 or 2."
    exit 1
fi

echo "Sorted file list saved to $OUTPUT_FILE."

