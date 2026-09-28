#!/bin/bash

check_directory() {
    dir=$1

    if [ ! -d "$dir" ]; then
        echo "Directory '$dir' does not exist."
        return
    fi

    echo "Directory: $dir"

    echo "Number of files: $(find "$dir" -type f | wc -l)"

    Disk_usagemb=$(du -sm "$dir" | cut -f1)
    echo "Disk usage: ${Disk_usagemb} MB"

    if [ "$Disk_usagemb" -lt 100 ]; then
        echo "Small (< 100 MB)"
    elif [ "$Disk_usagemb" -le 1024 ]; then
        echo "Medium (100 MB - 1 GB)"
    else
        echo "Large (> 1 GB)"
    fi
}

if [ "$#" -eq 0 ]; then
    echo "Write a valid command!"
    exit 1
fi

for dir in "$@"; do
    check_directory "$dir"
done
