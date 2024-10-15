#!/usr/bin/env bash

# Get the current timestamp in the required format: YYYYMMDD_HHMMSS
timestamp=$(date '+%Y%m%d_%H%M%S')

# Check if the heart_rate_log.txt file exists
if [ ! -f heart_rate_log.txt ]; then
  echo "Error: The file heart_rate_log.txt does not exist. Exiting."
  exit 1
else
  # Rename the log file with the timestamp
  mv heart_rate_log.txt "heart_rate_log.txt_$timestamp"
  echo "Log file archived as heart_rate_log.txt_$timestamp"
fi

