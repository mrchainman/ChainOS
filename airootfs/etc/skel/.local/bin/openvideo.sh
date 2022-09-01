#!/bin/sh
if [ -n "$(pgrep mpv)" ]
then
	echo "loadfile \"$1\" append-play" | socat - /tmp/mpv.fifo
else
	if [ -f /tmp/mpv.fifo ]
	then
		mkfifo /tmp/mpv.fifo
	fi
	mpv  --input-ipc-server="/tmp/mpv.fifo" "$1"  --idle --ao=pulse --framedrop=vo --video-latency-hacks=yes --player-operation-mode=pseudo-gui --x11-name=nullplayer --title=nullplayer --script=/usr/share/mpv/scripts/mpris.so --geometry=98%:90%
	# mpv  --input-ipc-server="/tmp/mpv.fifo" "$1"  --idle --ao=pulse --framedrop=vo --video-latency-hacks=yes --player-operation-mode=pseudo-gui --geometry=25%x25%-100%+100%
fi
