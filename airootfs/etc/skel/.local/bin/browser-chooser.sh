#!/bin/sh
url=$1
browser=$(printf "Copy\nQutebrowser\nJitsi\nZathura\nMPV" | dmenu -i -p "")

case $browser in
	Copy)
		echo "$url" | xclip -i -selection clipboard ;;
	Qutebrowser)
		qutebrowser "$url" ;;
	Jitsi)
		jitsify.sh "$url" ;;
	Zathura)
		zathura "$url" ;;
	MPV)
		openvideo.sh "$url" ;;
	# Chromium)
	# 	chromium "$url" ;;
	# Firefox)
	# 	firefox-esr "$url" ;;
	# Firedragon)
	# 	firedragon "$url" ;;
esac
