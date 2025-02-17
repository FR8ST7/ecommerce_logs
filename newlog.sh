#!/bin/bash

# Define log directory and file
log_dir="logs"
transaction_log="$log_dir/transactions.log"

# Ensure the log directory exists
mkdir -p "$log_dir"

# Function to create and write initial transaction entries
initialize_transaction_log() {
    echo "---- TRANSACTION LOG ----" > "$transaction_log"
    echo "Log Created: $(date '+%Y-%m-%d %H:%M:%S')" >> "$transaction_log"
    echo "---------------------------------" >> "$transaction_log"
    echo "2025-02-18 01:40:00 - OrderID 2001 - Customer: Alice Brown - Amount: $100 - Status: Completed" >> "$transaction_log"
    echo "2025-02-18 01:42:30 - OrderID 2002 - Customer: Bob White - Amount: $250 - Status: Pending" >> "$transaction_log"
    echo "2025-02-18 01:45:10 - OrderID 2003 - Customer: Charlie Green - Amount: $75 - Status: Cancelled" >> "$transaction_log"
    
    echo "Transaction log initialized successfully in $log_dir/"
}

# Call the function
initialize_transaction_log

