#!/bin/sh
case $1 in
	f)
		/bin/cat $2 | nc termbin.com 9999;;
	t)
		echo $2 | nc termbin.com 9999;;
esac
