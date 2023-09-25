python3 -c 'import pty; pty.spawn("/bin/bash")'

# Ctrl + Z to put shell in bg then:
stty raw -echo; fg

export TERM=xterm
stty cols 104
stty rows 24
