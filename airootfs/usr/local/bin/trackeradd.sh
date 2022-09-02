#!/bin/sh
id="$1"
 while read line; do transmission-remote -t $id -td $line; done < ~/Files/Utils/textfiles/trackerlist.txt
