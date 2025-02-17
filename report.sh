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
    # Read each customer log entry
    while IFS= read -r line; do
        if [[ $line =~ Customer\ ID:\ (C[0-9]+) ]]; then
            customer_id=${BASH_REMATCH[1]}
            customer_name=$(grep -A 4 "Customer ID: $customer_id" "$customer_log" | grep "Name" | cut -d ':' -f2 | xargs)
            customer_email=$(grep -A 4 "Customer ID: $customer_id" "$customer_log" | grep "Email" | cut -d ':' -f2 | xargs)
            customer_phone=$(grep -A 4 "Customer ID: $customer_id" "$customer_log" | grep "Phone" | cut -d ':' -f2 | xargs)
            customer_address=$(grep -A 4 "Customer ID: $customer_id" "$customer_log" | grep "Address" | cut -d ':' -f2 | xargs)
            registration_date=$(grep -A 4 "Customer ID: $customer_id" "$customer_log" | grep "Registration Date" | cut -d ':' -f2 | xargs)

            # Write customer details to the report
            echo "Customer ID: $customer_id" >> "$report_file"
            echo "Name: $customer_name" >> "$report_file"
            echo "Email: $customer_email" >> "$report_file"
            echo "Phone: $customer_phone" >> "$report_file"
            echo "Address: $customer_address" >> "$report_file"
            echo "Registration Date: $registration_date" >> "$report_file"
            echo "------------------------------------------" >> "$report_file"
        fi

        # Extract order details
        if [[ $line =~ Order\ ID:\ (O[0-9]+) ]]; then
            order_id=${BASH_REMATCH[1]}
            items=$(grep -A 3 "Order ID: $order_id" "$order_log" | grep "Items" | cut -d ':' -f2 | xargs)
            total_amount=$(grep -A 3 "Order ID: $order_id" "$order_log" | grep "Total Amount" | cut -d ':' -f2 | xargs)
            order_status=$(grep -A 3 "Order ID: $order_id" "$order_log" | grep "Order Status" | cut -d ':' -f2 | xargs)
            order_date=$(grep -A 3 "Order ID: $order_id" "$order_log" | grep "Order Date" | cut -d ':' -f2 | xargs)

            echo "Order ID: $order_id" >> "$report_file"
            echo "Items: $items" >> "$report_file"
            echo "Total Amount: $total_amount" >> "$report_file"
            echo "Order Status: $order_status" >> "$report_file"
            echo "Order Date: $order_date" >> "$report_file"
            echo "------------------------------------------" >> "$report_file"
        fi

        # Extract payment details
        if [[ $line =~ Payment\ ID:\ (P[0-9]+) ]]; then
            payment_id=${BASH_REMATCH[1]}
            order_id=$(grep -A 3 "Payment ID: $payment_id" "$payment_log" | grep "Order ID" | cut -d ':' -f2 | xargs)
            payment_mode=$(grep -A 3 "Payment ID: $payment_id" "$payment_log" | grep "Payment Mode" | cut -d ':' -f2 | xargs)
            amount_paid=$(grep -A 3 "Payment ID: $payment_id" "$payment_log" | grep "Amount Paid" | cut -d ':' -f2 | xargs)
            payment_status=$(grep -A 3 "Payment ID: $payment_id" "$payment_log" | grep "Payment Status" | cut -d ':' -f2 | xargs)
            payment_date=$(grep -A 3 "Payment ID: $payment_id" "$payment_log" | grep "Payment Date" | cut -d ':' -f2 | xargs)

            echo "Payment ID: $payment_id" >> "$report_file"
            echo "Order ID: $order_id" >> "$report_file"
            echo "Payment Mode: $payment_mode" >> "$report_file"
            echo "Amount Paid: $amount_paid" >> "$report_file"
            echo "Payment Status: $payment_status" >> "$report_file"
            echo "Payment Date: $payment_date" >> "$report_file"
            echo "------------------------------------------" >> "$report_file"
        fi

        # Extract refund details
        if [[ $line =~ Refund\ ID:\ (R[0-9]+) ]]; then
            refund_id=${BASH_REMATCH[1]}
            order_id=$(grep -A 3 "Refund ID: $refund_id" "$refund_log" | grep "Order ID" | cut -d ':' -f2 | xargs)
            refund_amount=$(grep -A 3 "Refund ID: $refund_id" "$refund_log" | grep "Refund Amount" | cut -d ':' -f2 | xargs)
            reason=$(grep -A 3 "Refund ID: $refund_id" "$refund_log" | grep "Reason" | cut -d ':' -f2 | xargs)
            refund_status=$(grep -A 3 "Refund ID: $refund_id" "$refund_log" | grep "Refund Status" | cut -d ':' -f2 | xargs)
            refund_date=$(grep -A 3 "Refund ID: $refund_id" "$refund_log" | grep "Refund Date" | cut -d ':' -f2 | xargs)

            echo "Refund ID: $refund_id" >> "$report_file"
            echo "Order ID: $order_id" >> "$report_file"
            echo "Refund Amount: $refund_amount" >> "$report_file"
            echo "Reason: $reason" >> "$report_file"
            echo "Refund Status: $refund_status" >> "$report_file"
            echo "Refund Date: $refund_date" >> "$report_file"
            echo "------------------------------------------" >> "$report_file"
        fi
    done < "$transaction_log"

}

# Call the function to generate the report
generate_report

# Output the result to the console
echo "Report generated successfully!"
cat "$report_file"

