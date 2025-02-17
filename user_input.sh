#!/bin/bash

# Define the function to manage records
manage_records() {
    echo "Select operation: "
    echo "1. Add Record"
    echo "2. Delete Record"
    echo "3. Modify Record"
    read -p "Enter choice (1/2/3): " choice

    echo "Select record type:"
    echo "1. Customer"
    echo "2. Order"
    echo "3. Payment"
    echo "4. Refund"
    read -p "Enter type (1/2/3/4): " type

    case $type in
        1) dir="customers"; prefix="customer";;
        2) dir="orders"; prefix="order";;
        3) dir="payments"; prefix="payment";;
        4) dir="refunds"; prefix="refund";;
        *) echo "Invalid type"; return;;
    esac

    case $choice in
        1)  # Add Record
            read -p "Enter file name (without extension): " filename
            read -p "Enter record details: " details
            echo -e "$details\n------------------------------------------" > "ecommerce_logs/$dir/${prefix}${filename}.log"
            echo "Record added: ecommerce_logs/$dir/${prefix}${filename}.log"
            ;;

        2)  # Delete Record
            read -p "Enter file name to delete (without extension): " filename
            file="ecommerce_logs/$dir/${prefix}${filename}.log"
            if [ -f "$file" ]; then
                rm "$file"
                echo "Record deleted: $file"
            else
                echo "Record not found!"
            fi
            ;;

        3)  # Modify Record
            read -p "Enter file name to modify (without extension): " filename
            file="ecommerce_logs/$dir/${prefix}${filename}.log"
            if [ -f "$file" ]; then
                read -p "Enter new details: " new_details
                echo -e "$new_details\n------------------------------------------" > "$file"
                echo "Record modified: $file"
            else
                echo "Record not found!"
            fi
            ;;

        *) echo "Invalid choice!";;
    esac
}

# Call the function
manage_records

