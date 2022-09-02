#!/bin/bash
letter="$1"
case $letter in
	o)
	        umlaut="ö";;
	a)
	        umlaut="ä";;
	u)
		umlaut="ü";;
esac
echo -n $umlaut | xclip -selection clipboard
