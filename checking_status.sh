#!/bin/bash

# Function to check availability of manga products and print relevant details
check_availability() {
    log_file=$1  # The log file to read from
    
    # Check if the log file exists
    if [ ! -f "$log_file" ]; then
        echo "Error: Log file $log_file not found."
        return
    fi

    echo "Checking availability for manga products in $log_file..."
    
    # Initialize manga counter
    manga_count=0

    # Read each line from the log file
    while IFS= read -r line; do
        # Debugging: print each line being processed
        echo "Processing line: $line"
        
        # Check if the line contains the manga product details
        if [[ $line == *"ProductID:"* && $line == *"Product Name:"* && $line == *"Price:"* && $line == *"Availability:"* ]]; then
            # Extract product details using regex
            product_id=$(echo "$line" | sed -n 's/.*ProductID: \([^ ]*\).*/\1/p')
            product_name=$(echo "$line" | sed -n 's/.*Product Name: \([^ ]*\).*/\1/p')
            price=$(echo "$line" | sed -n 's/.*Price: \([^ ]*\).*/\1/p')
            availability=$(echo "$line" | sed -n 's/.*Availability: \([^ ]*\).*/\1/p')

            # Check for manga category (manga log)
            if [[ "$line" == *"Category: Manga"* && $manga_count -lt 4 ]]; then
                ((manga_count++))
                echo "Manga $manga_count - ID: $product_id"
                echo "Manga Name: $product_name"
                echo "Price: $price"
                echo "Availability: $availability"
                echo "------------------------------------------"
            fi

            # Stop once we have 4 manga
            if [ $manga_count -ge 4 ]; then
                break
            fi
        fi
    done < "$log_file"
}

# Example Usage - Checking the manga.log file
check_availability "ecommerce_logs/books/manga.log"

