#!/bin/sh
process=$( ps aux | fzf -e | awk '{print $2}' )
echo "Do you want to kill $process?"
read -r sure
case $sure in
	yes)
		echo "killing ""$process""..." &&
		sudo kill -9 "$process";;
	no)
		echo "exiting..." &&
		exit 0;;
esac

