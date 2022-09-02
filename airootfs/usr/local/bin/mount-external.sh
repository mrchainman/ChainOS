#!/bin/sh
pgrep -x dmenu && exit
mountable=$(lsblk -lp  | grep "part " | awk '{print $1, "(" $4 ")"}')
if [ "$mountable" = "" ]
then
	notify-send "Mount" "No mountable Drives detected" && exit 0
fi
choosen=$(echo "$mountable" | dmenu -i -p "Which Drive would you like to mount?" | awk '{print $1}')
if [ "$choosen" = "" ]
then
	exit 0
fi
sudo mount "$choosen" && pgrep -x dunst && notify-send "Mount" "$choosen mounted." && exit 0
dirs=$(find /mnt -type d -maxdepth 3 2>/dev/null)
mountpoint=$(echo "$dirs" | dmenu -i -p "Choose Mountpoint.")
if [ ! -d "$mountpoint" ]
then
	mkdiryn=$(printf "No\nYes" | dmenu -i -p "$mountpoint does not exit. Create it?")
	if [ "$mkdiryn" = Yes ]
	then
		doas -- mkdir -p "$mountpoint"
	fi
fi
sudo mount "$choosen" "$mountpoint" && pgrep -x dunst && notify-send "Mount" "$choosen mounted to $mountpoint."
