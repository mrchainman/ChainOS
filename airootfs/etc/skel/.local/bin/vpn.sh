#!/bin/bash
case $1 in
	u*)
		sudo wg-quick up wg0;;
	d*)
		sudo wg-quick down wg0;;
esac
