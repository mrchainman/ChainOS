#!/bin/sh
property="\"$2\""
action="$3"
case $1 in
	s)
		echo "{ \"command\": [\"set_property\", $property, $action ] }" | socat - /tmp/mpv.fifo 2>/dev/null ;;
	g)
		echo "{ \"command\": [\"get_property_string\", $property ] }" | socat - /tmp/mpv.fifo 2>/dev/null ;;
esac
