#!/bin/bash

# Define the directory containing theme-related files
THEME_DIR="ecommerce_logs"

# Check if the directory exists
if [[ ! -d "$THEME_DIR" ]]; then
    echo "Error: Directory $THEME_DIR does not exist."
    exit 1
fi

echo "Listing all files in $THEME_DIR with size and last modified date:"
echo "---------------------------------------------------------------"
printf "%-50s %-15s %-20s\n" "File Name" "Size (KB)" "Last Modified Date"
echo "---------------------------------------------------------------"

# List files with details
find "$THEME_DIR" -type f -printf "%-50f %-15s %-20t\n"

echo "---------------------------------------------------------------"
echo "Total files: $(find "$THEME_DIR" -type f | wc -l)"

