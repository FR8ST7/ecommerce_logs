#!/bin/bash

# Function to search for a keyword in a file and return its position
search_keyword() {
    file=$1        # The file to search in
    keyword=$2     # The keyword to search for

    # Check if the file exists
    if [ ! -f "$file" ]; then
        echo "Error: File $file not found."
        return
    fi

    # Use grep to find the keyword and display the line number where it appears
    echo "Searching for '$keyword' in $file..."
    grep -n "$keyword" "$file"
    
    # Check if the keyword was found
    if [ $? -eq 0 ]; then
        echo "'$keyword' found in $file."
    else
        echo "'$keyword' not found in $file."
    fi
}

# Prompt user for input
read -p "Enter the path of the file to search in: " file_path
read -p "Enter the keyword to search for: " keyword

# Call the function with user inputs
search_keyword "$file_path" "$keyword"

