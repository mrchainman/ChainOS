#!/bin/bash
printf "Updating pacman...\n" &&
pacman -Sy &&
printf "Installing packages form lists\nThis may take a while...\nGrab yourself a coffee and wait :D\n...\n" &&
printf "Starting with main..." &&
pacman -S --noconfirm $(cat ../packages/main.pkgs) &&
printf "Done with main, continuing with libraries...\n" &&
pacman -S --noconfirm $(cat ../packages/libraries.pkgs) &&
printf "Done with libraries, continuing with lowlevelutils...\n" &&
pacman -S --noconfirm $(cat ../packages/lowlevelutils.pkgs) &&
printf "Done with done with lowlevelutils, continuing with python...\n" &&
pacman -S --noconfirm $(cat ../packages/python.pkgs) &&
printf "Done with python, continuing with de...\n" &&
pacman -S --noconfirm $(cat ../packages/de.pkgs) &&
printf "Done with de, continuing with audio...\n" &&
pacman -S --noconfirm $(cat ../packages/audio.pkgs) &&
printf "Done with audio, continuing with fonts...\n" &&
pacman -S --noconfirm $(cat ../packages/fonts.pkgs) &&
printf "Done with fonts, continuing with repos...\n" &&
pacman -S --noconfirm $(cat ../packages/repos.pkgs) &&
printf "Updating new repos..." &&
pacman -Sy &&
printf "Done with repos, continuing with garuda...\n" &&
pacman -S --noconfirm $(cat ../packages/garuda.pkgs) &&
printf "Done with garuda, continuing with pentest...\n" &&
pacman -S --noconfirm $(cat ../packages/pentest.pkgs) &&
printf "Done with pentest, continuing with programs...\n" &&
pacman -S --noconfirm $(cat ../packages/programs.pkgs) &&
printf "Done with programs, continuing with virutalisation...\n" &&
pacman -S --noconfirm $(cat ../packages/virutalisation.pkgs) &&
printf "Done with virutalisation, continuing with aur...\n" &&
paru -S --noconfirm $(cat ../packages/aur.pkgs) &&
printf "Done with aur, continuing with pip...\n" &&
pip install -r ../packages/pip.pkgs &&
printf "Done installing packages!\nTime to configure your new system :D\n\nChainOS version 0.1\n\n"

printf "Please enter your desired username:\n"
read username
printf "Please enter your desired timezone:\n(Example: Europe/Berlin)\n"
read tz
printf "Please enter your desired hostname:\n"
read hostname
printf "Do you want to use systemd-homed?(y/n)\n"
read homed
ln -sf /usr/share/zoneinfo/$tz /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo $hostname > /etc/hostname
if [ $homed = y ]
then
	# homed user
	homectl create $username --storage=luks --shell=/bin/bash --member-of=sys,scanner,vboxusers,wireshark,cups,libvirt,plugdev,docker,sambashare,realtime,video,lp,kvm,input,wheel
else
	# Normal user
	useradd -s /bin/bash $username
	printf "Please enter the Password for your new user:\n"
	passwd $username
	while IFS= read -r line; do
		usermod -aG $(echo $line | cut -d":" -f 1) $username
	done < /etc/group
fi
echo "HOME=/home/$username" > /etc/env
bootctl install || efibootmgr --create --disk /dev/sda --part 2 --loader "\EFI\systemd\systemd-bootx64.efi" --label "Linux Boot Manager" --verbose
ln -sf /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service
