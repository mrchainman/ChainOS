#!/bin/sh
fs=$(lsblk -o name,label,UUID,FSTYPE,PATH | grep crypto_LUKS | grep -v 'loop' | awk '{print $2": "$5}')
choice=$(echo $fs | dmenu)
label=$(echo $choice | awk -F: '{print $1}')
path=$(echo $choice | awk -F: '{print $2}')
case $1 in
	open)
		pw=$(yad --entry --entry-label="Insert Luks Passphrase:" --hide-entry)
		echo -n "$pw" | sudo cryptsetup luksOpen $path $label -d - &&
		sudo mkdir /run/media/$label &&
		sudo mount /dev/mapper/$label /run/media/$label
		dunstify "Mounted $path to $label"
		;;
	close)
		sudo umount /dev/mapper/$label
		sudo cryptsetup luksClose /dev/mapper/$label
		dunstify "Unmounted $label at $path"
		;;
esac
