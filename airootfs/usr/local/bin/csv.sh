#!/bin/sh
file=$1
column -s, -t < $file | less -#2 -N -S
