# KoTH Tools

A collection of tools that I use in TryHackMe's
[King of the Hill](https://tryhackme.com/games/koth) competition.

## Overview

This tools are mostly made to be used in linux machines.

### CVEs directory

This directory contains exploits for CVEs found in the machines.

- [CVE-2019-18634-sudo-buffer-overflow](CVEs/CVE-2019-18634-sudo-buffer-overflow/)
- [CVE-2021-3156-dirtypipe            ](CVEs/CVE-2021-3156-dirtypipe/)
- [CVE-2021-3493-overlayfs            ](CVEs/CVE-2021-3493-overlayfs/)
- [CVE-2021-4034-pwnkit               ](CVEs/CVE-2021-4034-pwnkit/)

### static directory

This directory contains static binaries that can be used in the machines.
These binaries are compiled statically to avoid problems with missing
dependencies. Some of them are used in other tools.

- [changeattr ](static/changeattr)  - Change the attributes of a file.
- [echo       ](static/echo)        - Print a string. **\***
- [inotifywait](static/inotifywait) - Wait for changes to files using inotify.
- [lsattr     ](static/lsattr)      - List file attributes. **\***
- [pspy64     ](static/pspy64)      - Monitor processes without root permissions.
- [real_chattr](static/real_chattr) - Change the attributes of a file.

**\*** Compiled with [Makefile](static/Makefile). Source code available in the [static](static/) directory.

### monitor directory

Currently in development.

Includes a script to monitor file changes in the ´/root/king.txt´ file.

When changes are detected, the script will attempt to overwrite the file with the player username.

### animations directory

- [hello.sh   ](animations/hello.sh)    - Display a "Hello" message.
- [nyan       ](animations/nyan)        - Display nyan cat animation.
- [rickroll.sh](animations/rickroll.sh) - Display rickroll lyrics animation.
- [spin.sh    ](animations/spin.sh)     - Display animation of a spinning saturn.

This directory contains animations that can be displayed in other player's terminals. Like so:

```bash
# Get your tty number
tty
# Enumerate the tty numbers of other players
ls -l /dev/pts/
# Display the animation in the other player's terminal
./animations/nyan > /dev/pts/<tty_number>
```

Getting your terminal spammed with animations is a major step towards winning the game.

Here's a simple way on how you can you prevent that from happening using ssh:

```bash
ssh -T <username>@<ip>
tty
# No tty number will be displayed
```

From ssh manual:

```
-T      Disable pseudo-terminal allocation.
```

<!-- TODO: Add more no tty examples -->

### scripts

- [autodownloader.sh ](autodownloader.sh)  - Automatically download scripts from attacker machine.
- [chattr            ](chattr)             - Malicious version of chattr. **\***
- [check.sh          ](check.sh)           - Check king.txt file and overwrite it if necessary.
- [flag-finder.sh    ](flag-finder.sh)     - Automatically find flags in the machine.
- [kingster.sh       ](kingster.sh)        - Write and protect king.txt file.
- [systemd.sh        ](systemd.sh)         - Create a backdoor service for persistence.
- [stable-shell.sh   ](stable-shell.sh)    - Stable reverse shell.
- [LinEnum.sh        ](LinEnum.sh)         - Linux enumeration script. ([source](https://github.com/rebootuser/LinEnum))
- [linpeas.sh        ](linpeas.sh)         - Linux Privilege Escalation Awesome Script. ([source](https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS))
- [PwnKit            ](PwnKit)             - Privilege escalation toolkit CVE-2021-4034. ([source](https://github.com/ly4k/PwnKit))
- [mount-trick.txt   ](mount-trick.txt)    - Mount trick to bypass chattr.
- [tricks.html       ](tricks.html)        - King of the Hill tricks. (generated from [tricks.md](tricks.md))
- [trollrc           ](trollrc)            - Troll .bashrc file.
- [port-scanner-nc.sh](port-scanner-nc.sh) - Port enumeration using netcat. Run with multiple threads for better performance.
- [url-path-finder.sh](url-path-finder.sh) - Find paths in a website by scanning source code.

**\*** According to KoTH rules **chattr** is the only binary that can be replaced in the machine.

### reverse shells

Used to get a reverse shell in the machine.

- [reverse-shell-bash.sh](reverse-shell-bash.sh)
- [reverse-shell-nc.sh](reverse-shell-nc.sh)
- [reverse-shell-php.php](reverse-shell-php.php)
- [reverse-shell-python.py](reverse-shell-python.py)

#### Special thanks to:

- [@MatheuZSecurity](https://github.com/MatheuZSecurity)
- - for his `tricks.md` file.
- - for inspiring me with his `systemd.sh` script.
- [@f11snipe](https://github.com/f11snipe)
- - for his `trollrc` file.
