#!/bin/bash

# 1

# dir="yo"

# if [ -d "$dir" ];
# then
#     find "$dir" type -f | wc -l
#     du -sh "$dir"
#     ls -ltrh "$dir"
# fi

# 2

# file="students.csv"

# if [ -f "$file" ];
# then 
#     echo "My name is $file"
#     wc -l < "$file"
#     grep -wc "CSE" "$file"
#     grep -wc "EE" "$file"

# else 
#     echo "File doesn't exist"

# fi

# 3

# du -sh "$HOME"/* | sort -rh | head -10

# 4

# find . -type f -exec basename {} \; | sort | uniq -d

# 5

# check_directory1(){
#     dir=$1

#     if [ ! -d "$dir" ]; 
#     then
#         echo "Directory doesn't exist"
#         return 
#     else 
#         find "$dir" -type f | wc -l 
#         du -sm "$dir"
#         size=$(du -sm "$dir" | cut -f1)
#         echo "the size is $size"
#         if [ "$size" -lt 100 ]; then
#             echo "the directory is small"
#         elif [ "$size" -le 1000 ]; then 
#             echo "the directory is medium"
#         else
#             echo "the directory is large" 
#         fi           
#     fi    



# }
# for dir in "$@"; do
#     check_directory1 "$dir"
# done

# 6 

# report="heramb1.txt"

# echo "Info report" > "$report"
# echo "Date and time $(date)" >> "$report"
# echo "the log-in user is $(whoami)" >> "$report"
# echo "the hostname is $(hostname)" >> "$report"
# echo "the current working directory is $(pwd)" >> "$report"
# echo "the Available space $(df -h)" >> "$report"
# echo "the available memory $(free -h)" >> "$report"
# echo "system uptime: $(uptime -p)" >> "$report"

# 7

# report="login_report1.txt"
# user=$1

# echo "USER LOGIN REPORT" > "$report"

# echo "Current user logged in: $(who)" >> "$report"

# echo "login time of each user" >> "$report"
# who | awk '{print $1 $3 $4}' >> "$report"

# echo "Number of logged-in users $(who | wc -l)" >> "$report"

# if [ -n "$user" ]; then
#     if who | awk '{print $1}' | grep -qx "$user"; then
#         echo "$user File exists" >> "$report" 
#     else
#         echo "$user Doesn't exist" >> "$report"
#     fi
# fi

# last -n 10 >> "$report"
# echo "Number of Unique Users Who Logged In" >> "$report"
# last | awk 'NF && $1 != "reboot" && $1 != "wtmp" {print $1}' | sort -u >> "$report"
# last -n 5 >> "$report"

# 9

# process=$1
# report="process_report1.txt"
# if [ -z "$process" ]; then
#     echo "please provide a process name"
#     exit 1
# fi     

# result=$(ps -ax -o pid=,command=,%cpu=,%mem= |
#     awk -v p="$process" 'tolower($0) ~ tolower(p)')

# if [ -n "$result" ]; then
#     echo "Process: $process" >> "$report"
#     echo "PID     CPU%    MEM%" >> "$report"
#     echo "$result" >> "$report"
# else
#     echo "Process '$process' is not running." >> "$report"
# fi

echo Current logged-in user $(whoami)
echo All currently logged in users $(who)
echo total number of users logged-in $(who | wc -l)
scp "heramb1.txt" "heramb.txt"
echo todays date is $(date)
echo current working directory is $(pwd) 