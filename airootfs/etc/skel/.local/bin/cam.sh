#!/bin/sh
cam=$(printf "video0\nvideo2\nvideo4" | dmenu -i -p "Choose cam:")
ffplay /dev/$cam
