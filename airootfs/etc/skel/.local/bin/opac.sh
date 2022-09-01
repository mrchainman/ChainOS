#!/bin/bash
term=$(printf "newsboat\nneomutt\nbtop\nikhal\nneovim\nspotify\nzabbix\nscratch" | dmenu -i -p "")
opac=$(printf "1\n0.45\n0.9\n" | dmenu -i -p "")
kitty @ --to unix:@$term set-background-opacity $opac
