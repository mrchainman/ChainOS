#!/bin/bash
station=`echo -e "Rockantenne\nVirgin" | dmenu -l 10 -i -p "Choose Station:"`
case $station in
	Rockantenne)
		openvideo.sh http://www.rockantenne.de/webradio/rockantenne.m3u ;;
	Virgin)
		openvideo.sh http://icy.unitedradio.it/VirginHardRock.mp3 ;;
esac
