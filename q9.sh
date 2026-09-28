#!/bin/bash

report="process_report.txt"
process=$1

echo "PROCESS INFORMATION REPORT" > "$report"
echo "--------------------------" >> "$report"

if [ -z "$process" ]; then
    echo "Please provide a process name."
    exit 1
fi

result=$(ps -ax -o pid=,command=,%cpu=,%mem= |
    awk -v p="$process" 'tolower($0) ~ tolower(p)')

if [ -n "$result" ]; then
    echo "Process: $process" >> "$report"
    echo "PID     CPU%    MEM%" >> "$report"
    echo "$result" >> "$report"
else
    echo "Process '$process' is not running." >> "$report"
fi

echo "Report saved to $report"