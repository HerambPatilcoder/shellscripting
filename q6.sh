#!/bin/bash

report="heramb.txt"

echo "SYSTEM INFORMATION REPORT" > "$report"
echo "Date and Time: $(date)" >> "$report"
echo "Logged-in User: $(whoami)" >> "$report"
echo "Hostname: $(hostname)" >> "$report"
echo "Current Working Directory: $(pwd)" >> "$report"
echo "Available Disk Space: $(df -h)" >> "$report"
echo "Available Memory: $(free -h)" >> "$report"
echo "System Uptime: $(uptime -p)" >> "$report"

echo "Report saved to $report"