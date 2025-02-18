#!/bin/bash

# Define valid username and password
VALID_USERNAME="Frost"
VALID_PASSWORD="Frost123"

# Function to authenticate user
authenticate_user() {
    read -p "Enter username: " input_username
    read -s -p "Enter password: " input_password
    echo

    if [[ "$input_username" == "$VALID_USERNAME" && "$input_password" == "$VALID_PASSWORD" ]]; then
        echo "Authentication successful! You can now proceed with theme-related operations."
        return 0
    else
        echo "Authentication failed! Access denied."
        return 1
    fi
}

# Function to perform theme-related operation (e.g., borrowing a book)
perform_operation() {
    echo "Choose an operation:"
    echo "1. Borrow a book"
    echo "2. Place an order"
    echo "3. Exit"
    read -p "Enter your choice: " choice

    case "$choice" in
        1) echo "You have chosen to borrow a book."; ;;
        2) echo "You have chosen to place an order."; ;;
        3) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please try again."; perform_operation ;;
    esac
}

# Main Execution
authenticate_user && perform_operation

