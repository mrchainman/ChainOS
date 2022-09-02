**WORK IN PROGRESS**

**NOW WORKING:**

Live iso

Install script is still WIP

Welcome to ChainOS!

This is my spin on an arch distro.

It is tailored a lot to my personal needs, so I don't reccomend to use the ISO you find in this repo, but to build it yourself, by modifing everything as needed.

**Usage:**

The build is based on releng and build based on archiso , see https://wiki.archlinux.org/title/Archiso#Installation

Dependencies:

archiso

There are multiple files, where you can specify the installed packages, separated in categories:
- ./packages/audio.pkgs
- ./packages/aur.manual
- ./packages/de.pkgs
- ./packages/fonts.pkgs
- ./packages/garuda.pkgs
- ./packages/libraries.pkgs
- ./packages/lowlevelutils.pkgs
- ./packages/main.pkgs
- ./packages/pentest.pkgs
- ./packages/pip.manual
- ./packages/programs.pkgs
- ./packages/python.pkgs
- ./packages/repos.pkgs
- ./packages/virutalisation.pkgs

Onse you chose your packages, execute:

cat ./packages/*.pkgs > packages.x86_64

Everything you put under airootfs/ will be copied in to the Filesystem of the image.

The userconfiguration resides in airootfs/etc/skel/

To prepare for building just exeucte the setup.sh script

To build run

sudo mkarchiso -v -o ~/ ./

You will find the iso in your homedir

to test it with quemu:

run_archiso -u -i ~/<iso-name>

Once in the liveenvironment you can call `install-chainos` to start the installation process.

**CAREFUL**

Since this repo is tailored exactly to my needs, the script does just ask a few questions, it does NOT ask for confirmation!!! It will completly wipe the Harddrive.
Read it before executing!!!

**Basic systeminfotmation:**
- KR: linux-zen
- OS: Archlinux
- BL: systemd-boot
- DM: sddm
- WM: qtile
- BR: qutebrowser
- TE: Kitty
- CS: Catppuccin
- PG: See files mentioned above

**Tips and Tricks**

All the config files are in ~/.config

If you have questions about the "empty" homedir just look a the symlinks in the homedir and read ~/.config/bash/bash_exports

Some useful scripts can be found under ~/.local/bin

The two you will need for sure are:

get-wp.sh which clones some wallpapers into ~/.data/Pictures/Wallpapers/images

get-coc.sh which clones the coc config for nvim into ~/.config/coc

There are also some user systemd units which can be found under ~/.local/share/systemd/user

**CREDIT:**

Most of the configuation for qtile and other programs are taken from https://github.com/dani-lp/dotfiles

A lot of usefule packages come from the garuda and chaotic-aur repo https://garudalinux.org/

Base of the Qutebrowser home page was  https://github.com/DrElyk/Web-Browser-Homepage
