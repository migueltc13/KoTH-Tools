#!/bin/bash

escape_char=$(printf "\u1b")
read -rsn1 mode # get 1 character

if [[ $mode == "$escape_char" ]]; then
  read -rsn4 -t 0.001 mode # read 2 more chars
fi

case $mode in
  '') echo escape ;;
  '[a') echo UP ;;
  '[b') echo DOWN ;;
  '[d') echo LEFT ;;
  '[c') echo RIGHT ;;
  '[A') echo up ;;
  '[B') echo down ;;
  '[D') echo left ;;
  '[C') echo right ;;
  '[2~') echo insert ;;
  '[7~') echo home ;;
  '[7$') echo HOME ;;
  '[8~') echo end ;;
  '[8$') echo END ;;
  '[3~') echo delete ;;
  '[3$') echo DELETE ;;
  '[11~') echo F1 ;;
  '[12~') echo F2 ;;
  '[13~') echo F3 ;;
  '[14~') echo F4 ;;
  '[15~') echo F5 ;;
  '[16~') echo Fx ;;
  '[17~') echo F6 ;;
  '[18~') echo F7 ;;
  '[19~') echo F8 ;;
  '[20~') echo F9 ;;
  '[21~') echo F10 ;;
  '[22~') echo Fy ;;
  '[23~') echo F11 ;;
  '[24~') echo F12 ;;
  $'\x7f') echo backspace ;;
  *) echo "$mode";;
esac
