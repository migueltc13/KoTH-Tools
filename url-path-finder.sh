#!/bin/bash

URL=$1
PROTOCOL=$2

if [ "$1" == "" ]; then
    echo "Usage: $0 <URL> [PROTOCOL]"
fi

if [ "$2" == "" ]; then
    PROTOCOL="http"
fi

curl "$PROTOCOL://$URL" | tr " " "\n" | cut -d"'" -f2 | cut -d'"' -f2 | grep "$URL" | sort -u

# TODO: check if this works to get local links
curl "$PROTOCOL://$URL" | grep "href=/" | sort -u

exit 0
