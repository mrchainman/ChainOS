#!/bin/sh
kb_choice="$(awk '/! layout/{flag=1; next} /! variant/{flag=0} flag {print $2, "- " $1}' /usr/share/X11/xkb/rules/base.lst | dmenu -p "Choose Layout:")"
kb="$(echo "$kb_choice" | awk '{print $3}')"
setxkbmap "$kb" -option caps:escape
pkill -RTMIN+30 "${STATUSBAR:-dwmblocks}"

