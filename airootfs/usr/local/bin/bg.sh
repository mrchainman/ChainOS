#!/bin/bash
wpd="$HOME/.data/Pictures/Wallpapers/images"
wpc="$HOME/.config/wallpaper"
if [ -d "$wpd" ]
then
	nwp=$(shuf -n1 -e $wpd/*)
	if [ "$1" == "new" ]
	then
		ln -sf $nwp $wpc
	fi
fi
feh --no-fehbg --bg-fill $wpc
if [ "$1" == "lock" ]
then
	betterlockscreen -u $wpc
fi
