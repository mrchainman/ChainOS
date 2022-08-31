**WORK IN PROGRESS**

Welcome to ChainOS!
This is my spin on an arch distro.
It is tailored a lot to my personal needs, so I don't reccomend to use the ISO you find in this repo, but to build it yourself, by modifing everything as needed.

**Usage:**

The build is based on releng and build based on archiso , see https://wiki.archlinux.org/title/Archiso#Installation

There are to files, where you can specify the installed packages:
- ./packages.x86_64 for the live environment
- ./airootfs/etc/packages.x86_64 for the installed environment

Everything you put under airootfs/ will be copied in to the Filesystem of the image, but NOT into the installed system!
The userconfiguration resied in airootfs/etc/skel/ which is the only folder that will be copied over to the installed system.

Once in the liveenvironment you can call `bash install.sh` to start the installation process.

**CAREFUL**

Since this repo is tailored exactly to my needs, the script does NOT ask questions or ask for confirmation. It will completly wipe the Harddrive.
Read it before executing!

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

**CREDIT:**
Most of the configuation for qtile and other programs are taken from https://github.com/dani-lp/dotfiles
