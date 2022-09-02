#!/bin/bash

exclusionregex="\(/boot\|/home\|/\)$"
drives=$(lsblk -lp | grep "part  /" | grep -v "$exclusionregex" | awk '{print $1, "(" $4 ")", "on", $7}')
[[ "$drives" = "" ]] && exit
chosen=$(echo "$drives" | dmenu -i -p "Which drive would you like to UNMOUNT?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit
sudo umount $chosen && pgrep -x dunst && notify-send "Mount" "$chosen has been unmounted" || notify-send "Mount" "Could not unmount $chosen. Try to lazy umount it."
