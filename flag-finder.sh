#!/bin/bash

echo "Finding flags..."

find / -type f -name "*flag.txt" -o -name ".flag*" -o -name "flag" -o -name "user.txt" -o -name "root.txt" 2>/dev/null > temp_flags.txt

# grep -iR "THM{" / 2>/dev/null >> temp_flags.txt

if [[ -s temp_flags.txt ]]; then
    echo "All flags found"
    echo "Here are your flags."
    cat temp_flags.txt
else
    echo "No flags found"
fi
