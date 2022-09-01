#!/bin/bash
url=$(dragon-drag-and-drop -t -x)
target=~/Downloads
printf "Specify Filename:\n"
read filename
axel -o "$target/$filename" "$url"
