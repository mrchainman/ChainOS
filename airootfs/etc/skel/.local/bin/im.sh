#!/bin/bash
action=$1
image_1=$2
image_2=$3
size=$3
case $action in
	size)
		convert $image_1 -format "%[w]x%[h]" info: ;;
	stitch)
		convert $image_1 $image_2 +append ${image_1%.*}_${image_2%.*}_stitched.jpg ;;
	resize)
		convert $image_1 -resize $size\! $image_1 ;;
esac
