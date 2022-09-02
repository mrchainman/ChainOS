#!/bin/sh
dunstify -i transmission -A Y,yes "Transmission-daemon" "$TR_TORRENT_NAME has finished!" && cd ~/Downloads/Torrents && st -e vifmrun &
