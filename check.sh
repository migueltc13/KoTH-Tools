#!/bin/bash

# TODO: run as a systemd service

if [ "$1" == "" ]; then
    echo "usage: $0 <chattr_path>"
    exit 1
fi

chattr="$1"
username="z0d1ac"
king="/root/king.txt"
refresh_rate=1

while true; do
    current_username=$(cat "$king")
    if [ "$current_username" != "$username" ]; then
        sudo umount $king
        sudo $chattr -aiet $king
        sudo echo "$username" > "$king"
        sudo $chattr +aiet $king
        sudo mount --bind -o ro $king $king
    fi
    sleep $refresh_rate
done

exit 0