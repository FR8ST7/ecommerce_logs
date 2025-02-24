#!/bin/bash

# Define the theme directory
THEME_DIR="ecommerce_logs"

# Check if the directory exists
if [[ ! -d "$THEME_DIR" ]]; then
    echo "Error: Directory $THEME_DIR does not exist."
    exit 1
fi

# Count the number of files
file_count=$(find "$THEME_DIR" -type f | wc -l)

# Count the number of subdirectories
dir_count=$(find "$THEME_DIR" -type d | wc -l)

# Display the results
echo "Theme Directory: $THEME_DIR"
echo "Total Files: $file_count"
echo "Total Subdirectories: $dir_count"

