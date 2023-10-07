#!/bin/bash

echo "Finding flags..."

# Find by name
find / -type f -name "*flag.txt" -o -name ".flag*" -o -name "flag" -o -name "user.txt" -o -name "root.txt" 2>/dev/null > temp_flags.txt

# Find by date (use stat to check file dates)
find / -type f -newermt "2021-02-15 00:00:00" ! -newermt "2021-02-16 00:00:00" -ls 2>/dev/null >> temp_flags.txt

# Find by content
# grep -R "THM{" / 2>/dev/null >> temp_flags.txt
# grep -R "VEhN" / 2>/dev/null >> temp_flags.txt # base64

if [[ -s temp_flags.txt ]]; then
    echo "All flags found"
    echo "Here are your flags."
    cat temp_flags.txt
else
    echo "No flags found"
fi
