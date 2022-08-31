#!/bin/bash
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
