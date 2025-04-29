#!/bin/bash

# Function to backup E-Commerce logs
backup_logs() {
    src_dir="ecommerce_logs"
    backup_dir="backup"
    log_file="backup/backup_status.log"
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    # Ensure backup directory exists
    mkdir -p "$backup_dir"

    # Print and log the backup start time
    echo "Backup started at $timestamp"
    echo "Backup started at $timestamp" >> "$log_file"

    # Copy logs and track success/failure
    if cp -r "$src_dir" "$backup_dir"; then
        success_msg="$timestamp - Backup successful"
        echo "$success_msg"
        echo "$success_msg" >> "$log_file"
    else
        fail_msg="$timestamp - Backup failed"
        echo "$fail_msg"
        echo "$fail_msg" >> "$log_file"
    fi
}

# Call the function
backup_logs

