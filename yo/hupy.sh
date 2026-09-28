#!/bin/bash

project=$1 
user="heramb.txt"
if [ -d "$project" ]
then 
    find "$project" -type f | ls -l "$project"
fi    

echo "No. of lines in $user : $(wc -l "$user")" >> "$user"
