#!/bin/bash

# Define the directory containing theme-related files
THEME_DIR="ecommerce_logs"

# Prompt user for file names
read -p "Enter the first file to compare: " file1
read -p "Enter the second file to compare: " file2

# Construct full file paths
file1_path="$THEME_DIR/$file1"
file2_path="$THEME_DIR/$file2"

# Check if both files exist
if [[ ! -f "$file1_path" ]]; then
    echo "Error: $file1 does not exist in $THEME_DIR."
    exit 1
fi

if [[ ! -f "$file2_path" ]]; then
    echo "Error: $file2 does not exist in $THEME_DIR."
    exit 1
fi

# Display differences between the files
echo "Comparing $file1 and $file2..."
echo "-----------------------------------------"
diff -u "$file1_path" "$file2_path" | less
echo "-----------------------------------------"

# Option to save differences to a file
read -p "Do you want to save the differences to a file? (y/n): " save_choice
if [[ "$save_choice" == "y" ]]; then
    diff -u "$file1_path" "$file2_path" > "file_differences.txt"
    echo "Differences saved to file_differences.txt"
fi

echo "Comparison complete!"

