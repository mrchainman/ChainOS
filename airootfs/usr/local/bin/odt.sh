#!/bin/sh
odt2txt --output="/tmp/odtfile" "$1" && nvim /tmp/odtfile
