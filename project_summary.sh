#!/bin/bash

project="yo"

if [ -d "$project" ];
then 
   echo "File exists"
   find "$project" -type f | wc -l
   du -sh "$project"
   ls -ltrh "$project"
else 
   echo "File doesn't exists"  
fi   

echo "Analysis completed"

