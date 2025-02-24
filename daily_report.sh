#!/bin/bash

# Define directory to monitor
THEME_DIR="$HOME/git/ecommerce_logs"
SNAPSHOT_FILE="$HOME/git/ecommerce_logs/last_snapshot.txt"
REPORT_FILE="$HOME/git/ecommerce_logs/daily_report.txt"

# Get current date and time
current_date=$(date +"%A %d %B %Y %I:%M:%S %p %Z")

# Print report header
echo "Daily Report - $current_date" > "$REPORT_FILE"
echo "----------------------------------" >> "$REPORT_FILE"

# Create a new snapshot of the current state
find "$THEME_DIR" -type f -printf "%T@ %p\n" | sort > "$HOME/git/ecommerce_logs/current_snapshot.txt"

# Check if previous snapshot exists
if [[ ! -f "$SNAPSHOT_FILE" ]]; then
    echo "No previous snapshot found. Creating initial snapshot..."
    mv "$HOME/git/ecommerce_logs/current_snapshot.txt" "$SNAPSHOT_FILE"
    echo -e "New Files:\n\nDeleted Files:\n\nModified Files:" >> "$REPORT_FILE"
    exit 0
fi

# Compare snapshots
new_files=$(comm -13 "$SNAPSHOT_FILE" "$HOME/git/ecommerce_logs/current_snapshot.txt" | awk '{print $2}')
deleted_files=$(comm -23 "$SNAPSHOT_FILE" "$HOME/git/ecommerce_logs/current_snapshot.txt" | awk '{print $2}')
modified_files=$(awk 'NR==FNR {a[$2]=$1; next} ($2 in a) && ($1 != a[$2]) {print $2}' "$SNAPSHOT_FILE" "$HOME/git/ecommerce_logs/current_snapshot.txt")

# Append results to the report
echo -e "New Files:\n$new_files\n" >> "$REPORT_FILE"
echo -e "Deleted Files:\n$deleted_files\n" >> "$REPORT_FILE"
echo -e "Modified Files:\n$modified_files\n" >> "$REPORT_FILE"

# Update the snapshot file
mv "$HOME/git/ecommerce_logs/current_snapshot.txt" "$SNAPSHOT_FILE"

# Display the report
cat "$REPORT_FILE"

