#!/bin/bash

# Define the theme-related directory (Modify this path as needed)
THEME_DIR="ecommerce_logs"

# Function to search for files containing a keyword
search_files() {
    read -p "Enter the keyword to search for inside files: " keyword
    found_files=$(grep -rl "$keyword" "$THEME_DIR" 2>/dev/null)

    if [[ -n "$found_files" ]]; then
        echo "Files containing '$keyword':"
        echo "$found_files"
    else
        echo "No files found containing the keyword: $keyword"
    fi
}

# Execute the function
search_files

