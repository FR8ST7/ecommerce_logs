#!/bin/bash

# Define log file paths
CATALOG_FILE="/home/kali/ecommerce_logs/catalog.log"
ORDERS_FILE="/home/kali/ecommerce_logs/orders.log"
RETURNS_FILE="/home/kali/ecommerce_logs/returns.log"

# Function to catalog products
catalog_products() {
    echo "📦 Cataloging products..."
    cat "$CATALOG_FILE"
}

# Function to process an order
process_order() {
    read -p "Enter Product ID to order: " product_id
    read -p "Enter Quantity: " quantity
    echo "$product_id $quantity" >> "$ORDERS_FILE"
    echo "✅ Order placed for Product ID: $product_id (Quantity: $quantity)"
}

# Function to handle product returns
process_return() {
    read -p "Enter Product ID to return: " product_id
    read -p "Enter Return Quantity: " quantity
    echo "$product_id $quantity" >> "$RETURNS_FILE"
    echo "🔄 Product ID: $product_id (Quantity: $quantity) returned successfully."
}

# Create multiple processes
echo "Main Process ID: $$"

# Running cataloging in the background
(catalog_products) &

# Running ordering in the background
(process_order) &

# Running returns in the background
(process_return) &

# Wait for all background processes to finish
wait
echo "All e-commerce operations completed!"