#!/bin/bash

# Path to the stock log file
STOCK_FILE="/home/kali/ecommerce_logs/stock.log"

# Function to update stock
update_stock() {
    product_id=$1
    quantity=$2

    if grep -q "^$product_id " "$STOCK_FILE"; then
        # Update existing stock
        sed -i "/^$product_id /s/ [0-9]\+$/ $quantity/" "$STOCK_FILE"
        echo "Stock updated for Product ID: $product_id (New Quantity: $quantity)"
    else
        # Add new product entry
        echo "$product_id $quantity" >> "$STOCK_FILE"
        echo "New stock entry added for Product ID: $product_id (Quantity: $quantity)"
    fi
}

# Creating a child process
echo "Main Process ID: $$"
echo "Creating a child process to update stock..."

(
    echo "Child Process ID: $$"
    read -p "Enter Product ID: " product_id
    read -p "Enter Updated Quantity: " quantity
    update_stock "$product_id" "$quantity"
) & # Run in background

echo "Main process continues..."
wait # Wait for the child process to finish
echo "Stock update process completed."
