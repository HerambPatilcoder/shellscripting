#!/bin/bash

file="students.csv"

if [ -f "$file" ]; 
then
    wc -l < "$file"
    echo "No. of CSE students: "
    grep -wc "CSE" "$file"
    echo "No. of EE students: "
    grep -wc "EE" "$file"
    echo "Does CHE students exist?"
    grep "AE" "$file"
else
    echo "CSV File not found" 
fi    


