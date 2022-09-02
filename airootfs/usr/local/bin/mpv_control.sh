#!/bin/sh
case $1 in
	prev)
		command="playlist-prev";;
	next)
		command="playlist-next";;
	pause)
		command="cycle pause";;
esac
echo "$command" | socat - /tmp/mpv.fifo

