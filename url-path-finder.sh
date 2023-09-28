export URL=www.inlanefreight.com; export PROTOCOL=https; curl $PROTOCOL://$URL | tr " " "\n" | cut -d"'" -f2 | cut -d'"' -f2 | grep "$URL" | sort -u
