#!/bin/bash

# Function to copy a file to the specified directory
copy_file() {
    src_file=$1
    dest_dir=$2
    
    # Check if source file exists
    if [ ! -f "$src_file" ]; then
        echo "Error: Source file $src_file does not exist."
        return 1
    fi

    # Check if destination directory exists
    if [ ! -d "$dest_dir" ]; then
        echo "Error: Destination directory $dest_dir does not exist."
        return 1
    fi

    # Perform the copy operation
    cp "$src_file" "$dest_dir"
    
    # Check if the copy operation was successful
    if [ $? -eq 0 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Copy successful: $src_file → $dest_dir"
    else
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Copy failed: $src_file → $dest_dir"
    fi
}

# Call the copy function with user-provided arguments
copy_file "$1" "$2"

