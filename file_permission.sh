#!/bin/bash

# Define the theme-related directory
THEME_DIR="ecommerce_logs"

echo "Performing File Permission Audit in: $THEME_DIR"
echo "------------------------------------------------"

# Step 1: Audit Current Permissions
echo "Current Permissions:"
find "$THEME_DIR" -exec ls -ld {} \;

echo "------------------------------------------------"
echo "Modifying Permissions for Security..."
echo "------------------------------------------------"

# Step 2: Set permissions
find "$THEME_DIR" -type d -exec chmod 755 {} \;      # Directories: rwxr-xr-x
find "$THEME_DIR" -type f -exec chmod 644 {} \;      # Regular files: rw-r--r--
find "$THEME_DIR" -type f -name "*.sh" -exec chmod 750 {} \;  # Scripts: rwxr-x---

# Step 3: Verify Changes
echo "Updated Permissions:"
find "$THEME_DIR" -exec ls -ld {} \;

echo "------------------------------------------------"
echo "File Permission Audit & Security Hardening Complete!"

