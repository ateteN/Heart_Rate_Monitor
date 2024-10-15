#!/usr/bin/env bash

# Variables
remote_host="0a0db15af199.6b7419f6.alu-cod.online"      
remote_user="0a0db15af199"  
remote_dir="/home/"                 
archLog="archived_logs_group21"     

# Create the archive directory if it does not exist
if [ ! -d "$archLog" ]; then
  mkdir "$archLog"
  echo "Directory $archLog created."
fi

# Move all archived log files into the designated directory
mv heart_rate_log.txt_* "$archLog/"
echo "Moved archived log files to $archLog."

# Back up the archived files to the remote server
scp -r "$archLog/" "$remote_user@$remote_host:$remote_dir"
if [ $? -eq 0 ]; then
  echo "Backup successful!"
else
  echo "Error during backup."
fi

