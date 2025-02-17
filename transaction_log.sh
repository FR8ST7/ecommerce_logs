#!/bin/bash

# Function to list and categorize transaction logs
list_transaction_logs() {
    log_dir="ecommerce_logs"  # Base directory for transaction logs

    # Check if the log directory exists
    if [ ! -d "$log_dir" ]; then
        echo "Error: Transaction log directory '$log_dir' does not exist."
        return 1
    fi

    # Define categories
    categories=("orders" "customers" "payments" "refunds")

    echo "=============================="
    echo "   E-Commerce Transaction Logs"
    echo "=============================="

    # Loop through each category and list files
    for category in "${categories[@]}"; do
        log_path="$log_dir/$category"

        echo "Category: $category"
        echo "------------------------------"

        # Check if the category directory exists and list files
        if [ -d "$log_path" ]; then
            ls -1 "$log_path"/*.log 2>/dev/null || echo "No log files found in $category."
        else
            echo "No directory found for $category."
        fi

        echo ""  # Add spacing for readability
    done
}

# Call the function
list_transaction_logs

