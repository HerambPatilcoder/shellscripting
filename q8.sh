#!/bin/bash

report="login_report.txt"
user=$1

echo "USER LOGIN REPORT" > "$report"

echo "Currently Logged-in Users:" >> "$report"
who >> "$report"

echo "" >> "$report"
echo "Login Time of Each User:" >> "$report"
who | awk '{print $1, $3, $4}' >> "$report"

echo "" >> "$report"
echo "Number of Logged-in Users: $(who | wc -l)" >> "$report"

echo "" >> "$report"
if [ -n "$user" ]; then
    if who | awk '{print $1}' | grep -x "$user"; then
        echo "$user is currently logged in." >> "$report"
    else
        echo "$user is not currently logged in." >> "$report"
    fi
else
    echo "No user specified." >> "$report"
fi

echo "" >> "$report"
echo "Last 10 User Logins:" >> "$report"
last -n 10 >> "$report"

echo "" >> "$report"
echo "Number of Unique Users Who Logged In: $(last | awk 'NF && $1 != "reboot" && $1 != "wtmp" {print $1}' | sort -u | wc -l)" >> "$report"

echo "" >> "$report"
echo "Most Recent Logins:" >> "$report"
last -n 5 >> "$report"

echo ""
echo "Report saved to $report"