#!/bin/bash

# Define the directory containing theme-related files
THEME_DIR="ecommerce_logs"
BACKUP_DIR="backup"

# Define archive name with timestamp
TIMESTAMP=$(date +"%Y-%m-%d")
ARCHIVE_NAME="theme_backup_$TIMESTAMP.tar.gz"

# Ensure the backup directory exists
mkdir -p "$BACKUP_DIR"

# Find and archive files older than 30 days
find "$THEME_DIR" -type f -mtime +30 -print0 | tar -czvf "$BACKUP_DIR/$ARCHIVE_NAME" --null -T -

# Verify if the archive was created successfully
if [[ -f "$BACKUP_DIR/$ARCHIVE_NAME" ]]; then
    echo "Archive created successfully: $BACKUP_DIR/$ARCHIVE_NAME"

    # Optionally delete archived files
    read -p "Do you want to delete the archived files? (y/n): " delete_choice
    if [[ "$delete_choice" == "y" ]]; then
        find "$THEME_DIR" -type f -mtime +30 -delete
        echo "Old files deleted after archiving."
    else
        echo "Old files retained."
    fi
else
    echo "Error: Archive creation failed."
fi

