#!/bin/sh
man -k . | dmenu -l 20 | awk '{print $1}' | sed -e 's/(//' -e 's/)//' -e 's/[[:digit:]]$//' | xargs -r man -Tpdf | zathura -
