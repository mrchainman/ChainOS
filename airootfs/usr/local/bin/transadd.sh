#!/bin/sh
pgrep -x transmission-da >/dev/null || (transmission-daemon && dunstify -i transmission "Starting transmission daemon..." && sleep 3)
transmission-remote -a "$1" -td ~/Files/Utils/textfiles/trackerlist.txt && dunstify -i transmission -A Y,yes "Transmission-daemon" "Torrent added." &
