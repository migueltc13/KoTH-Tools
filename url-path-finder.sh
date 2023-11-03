#!/bin/bash

if [ "$1" == "" ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

URL=$1

# TODO only get the links in the command bellow
curl -s "$URL" | grep "$URL" | sort -u
curl -s "$URL" | grep -Eo "href=\".*\"" | cut -d'"' -f2 | sort -u
# curl -s "$URL" | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | sort -u

exit 0
