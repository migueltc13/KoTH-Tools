#!/bin/bash

if [ "$1" == "" ]; then
    echo "usage: $0 <IP>"
    exit 1
fi

host="$1"

for port in {1..65535}; do
    if (nc -z -w 1 $host $port 2>/dev/null); then
        process_info=$(lsof -i :$port -sTCP:LISTEN)
        if [ $? -eq 0 ]; then
            process_name=$(echo "$process_info" | awk 'NR==2 {print $1}')
            echo "Port $port is open and is being used by process: $process_name"
        else
            echo "Port $port is open but no process is using it."
        fi
    fi
done

exit 0
