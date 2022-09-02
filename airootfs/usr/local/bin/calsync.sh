#!/bin/sh
export DISPLAY=:0
vdirsyncer sync &&
notify-send "Calsync" "Calendar Updated"

