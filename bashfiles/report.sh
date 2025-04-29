#!/bin/bash

# File paths for log files
customer_log="logs/customer.log"
order_log="logs/order.log"
refund_log="logs/refund.log"
payment_log="logs/payment.log"
transaction_log="logs/transactions.log"
report_file="reports/usage_report.log"

# Ensure the report directory exists
mkdir -p "$(dirname "$report_file")"

# Initialize the report file
echo "---- E-COMMERCE TRANSACTION REPORT ----" > "$report_file"
echo "Report Generated: $(date '+%Y-%m-%d %H:%M:%S')" >> "$report_file"
echo "--------------------------------------" >> "$report_file"

# Function to extract information from logs and create the report
generate_report() {
    # Read each transaction log entry
    while IFS= read -r line; do
        echo "Processing line: $line"  # Debugging output

        # Extract OrderID from the transaction log entry
        if [[ $line =~ OrderID\ ([0-9]+) ]]; then
            order_id=${BASH_REMATCH[1]}
            echo "Found Order ID: $order_id"  # Debugging output

            # Extract customer name
            customer_name=$(echo "$line" | grep -oP "(?<=Customer: )[a-zA-Z ]+")

            # Extract amount
            amount=$(echo "$line" | grep -oP "(?<=Amount: )\d+")

            # Extract status
            status=$(echo "$line" | grep -oP "(?<=Status: )\w+")

            # Write transaction details to the report
            echo "Order ID: $order_id" >> "$report_file"
            echo "Customer: $customer_name" >> "$report_file"
            echo "Amount: $amount" >> "$report_file"
            echo "Status: $status" >> "$report_file"
            echo "------------------------------------------" >> "$report_file"
        fi
    done < "$transaction_log"
}

# Call the function to generate the report
generate_report

# Output the result to the console
echo "Report generated successfully!"
cat "$report_file"

