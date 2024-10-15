#!/usr/bin/env bash

# Prompt for the device name
read -p "Enter Device name: " device_name

# Check if the device_name is empty
if [ -z "$device_name" ]; then
  echo "Device name cannot be empty. Please restart the script and provide a valid name."
  exit 1
fi

# Specify the log file
logFile="heart_rate_log.txt"

# Start the background process to log heart rate data every second
{
  while true; do
    # Get current timestamp
    Timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    # Simulate heart rate between 60 and 99
    Simulatedrate=$(( RANDOM % 40 + 60 ))

    # Write data to the log file
    echo "$Timestamp $device_name $Simulatedrate" >> $logFile

    # Wait for 1 second before the next iteration
    sleep 1
  done
} &

# Capture and display the PID of the background process
echo "Heart rate monitoring started with PID $!"

