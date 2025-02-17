#!/bin/bash
create_transaction_log_dir() {
    mkdir -p "ecommerce_logs/{orders,customers,payments,refunds}"
    echo "E-Commerce transaction log directory structure created."
}
create_transaction_log_dir

