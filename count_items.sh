#!/bin/bash

# Prompt user for directory path
read -p "Enter the directory path to search in: " dir_path

# Check if directory exists
if [[ ! -d "$dir_path" ]]; then
    echo "Error: Directory $dir_path not found."
    exit 1
fi

# Initialize count variable
total_items=0

# Loop through all log files in the directory and count the occurrences of "ProductID"
for file in "$dir_path"/*.log; do
    if [[ -f "$file" ]]; then
        count=$(grep -c "ProductID:" "$file")
        total_items=$((total_items + count))
    fi
done

# Display total count
echo "Total number of theme-related items in $dir_path: $total_items"

