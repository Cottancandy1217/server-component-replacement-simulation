#!/bin/bash

# verification_script.sh
# This script performs basic verification checks after a RAM replacement.

# Variables
LOG_FILE="/var/log/syslog"  # Or your system log file
MEMTEST_LOG="/var/log/memtest.log" # Or your Memtest86+ log file
MEMTEST_COMMAND="memtester 1024 5"  # Example Memtest command (adjust as needed)

# Check system logs for memory errors
echo "Checking system logs for memory errors..."
if grep -i "memory error" "$LOG_FILE"; then
  echo "Memory errors found in system logs!"
  grep -i "memory error" "$LOG_FILE"
  ERROR_FOUND=1
else
  echo "No memory errors found in system logs."
  ERROR_FOUND=0
fi

# Run Memtest86+ (if installed and configured)
echo "Running memory diagnostics with Memtester..."
if command -v memtester &> /dev/null; then
  $MEMTEST_COMMAND > "$MEMTEST_LOG" 2>&1
  if grep -i "error" "$MEMTEST_LOG"; then
    echo "Memory errors found by Memtester!"
    cat "$MEMTEST_LOG"
    ERROR_FOUND=1
  else
    echo "Memtester found no errors."
  fi
else
  echo "Memtester not found. Skipping memory diagnostics."
fi

# Check available memory
echo "Checking available memory..."
free -h

# Check kernel memory information
echo "Checking kernel memory information..."
cat /proc/meminfo

# Check for successful boot
echo "Checking for successful boot..."
if [[ $ERROR_FOUND -eq 0 ]]; then
  echo "Verification completed successfully."
else
  echo "Verification completed with errors. Please check the logs."
  exit 1 # Exit with an error code
fi

exit 0 # Exit successfully
