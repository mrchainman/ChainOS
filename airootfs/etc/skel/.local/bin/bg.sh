#!/bin/bash
nwp=$(shuf -n1 -e ~/.data/Pictures/Wallpapers/images/*)
if [ "$1" == "new" ]
then
	ln -sf $nwp ~/.config/wallpaper
fi
feh --no-fehbg --bg-fill ~/.config/wallpaper
if [ "$1" == "lock" ]
then
	betterlockscreen -u ~/.config/wallpaper
fi
