#!/bin/sh
export DISPLAY=:0
export PATH=$PATH:$HOME/.local/bin
vdirsyncer sync &&
notify-send "Calsync" "Calendar Updated"

