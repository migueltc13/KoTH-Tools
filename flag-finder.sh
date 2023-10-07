#!/bin/bash

# Find by name
find / -type f -name "*flag.txt" -o -name ".flag*" -o -name "flag" -o -name "user.txt" -o -name "root.txt" 2>/dev/null

# Find by date (use stat to check file dates)
find / -type f -newermt "2021-02-15 00:00:00" ! -newermt "2021-02-16 00:00:00" -ls 2>/dev/null

# Find by content
# grep -iR "THM{" / 2>/dev/null
# grep -R  "VEhN" / 2>/dev/null # base64
