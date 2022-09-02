#!/bin/bash
export PATH="/home/davidc/.local/bin:$PATH"
/usr/lib/xfce-polkit/xfce-polkit &
bg.sh &
l.sh &
picom -b &
eww daemon &
mkfifo /tmp/vol-icon && ~/.config/qtile/scripts/vol_icon.sh &
dunst &
snixembed --fork &
iwgtk -i &
flameshot &
networkd-notify &
kitty --listen-on=unix:@neomutt --class="coms" -e "neomutt" &
kitty --listen-on=unix:@newsboat --class="coms" -e "newsboat" &
kitty --listen-on=unix:@ikhal --class="coms" -e "ikhal" &
kitty --listen-on=unix:@btop --class="coms" -e "btop" &
# kitty --listen-on=unix:@zabbix --class="mon" -e "zabbixmon" &
kitty --listen-on=unix:@spotify --class="Spotify" -e "spotify_player" &
kitty --listen-on=unix:@neovim --class="neovim" -e "nvim" &
qutebrowser &
