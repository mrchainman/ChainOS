#!/bin/sh
/usr/bin/pacman -Qne > /home/mrc/.data/pacman/official_pkgs.txt
/usr/bin/pacman -Qme > /home/mrc/.data/pacman/aur_pkgs.txt
/usr/bin/pacman -Qii | awk '/^MODIFIED/ {print $2}' > /home/mrc/.data/pacman/changed_files.txt
/usr/bin/pacman -Qtdq > /home/mrc/.data/pacman/orphans.txt


