**WORK IN PROGRESS**

Welcome to ChainOS!
This is my spin on an arch distro.
It is tailored a lot to my personal needs, so I don't reccomend to use the ISO you find in this repo, but to build it yourself, by modifing everything as needed.

**Usage:**

The build is based on releng and build based on archiso , see https://wiki.archlinux.org/title/Archiso#Installation

There are to files, where you can specify the installed packages:
- ./packages.x86_64 for the live environment
- ./airootfs/root/packages/ for the installed environment

To easely replicate the installed envrionment in the live environment you can use the folloing command:

cat airootfs/root/packages/* > packages.x86_64

Everything you put under airootfs/ will be copied in to the Filesystem of the image, but NOT into the installed system!
The userconfiguration resides in airootfs/etc/skel/

To prepare for building just exeucte the setup.sh script

Once in the liveenvironment you can call `cd scripts && bash install.sh` to start the installation process.

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
