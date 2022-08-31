#!/bin/bash
######################################################
######################################################
############## CHAIN OS INSTALL SCRIPT ###############
######################################################
######################################################
# Keymap
loadkeys us
# Check if booted in efi
ls /sys/firmware/efi/efivars 1>/dev/null && echo "Running in UEFI Mode"
# Test internet
ping -c 4 archlinux.org 1>/dev/null && echo "Online" || (echo "Offline, exiting..." && exit 0)
# Set time
timedatectl set-ntp true && timedatectl status
# Prepare partitions
parted -s /dev/sda mklabel gpt && printf "Set Label to GPT" || ( printf "Faliled to set Label... exiting" && exit 0)
parted -s /dev/sda mkpart ESP fat32 2MiB 500MiB && printf "Created ESP partition" || ( printf "Faliled to create ESP partition... exiting" && exit 0)
parted -s /dev/sda mkpart System btrfs 510MiB 100% && printf "Created System partition" || ( printf "Faliled to create System partition... exiting" && exit 0)
# Make filesystems
mkfs.fat /dev/sda1 && printf "Created fat FS" || ( printf "Failed to create fat FS exiting..." && exit 0 )
mkfs.btrfs /dev/sda2 && printf "Created btrfs FS" || ( printf "Failed to create btrfs FS exiting..." && exit 0 )
# Mount
mount /dev/sda2 /mnt 1>/dev/null && printf "Mounted /dev/sda2 on /mnt"
btrfs subvolume create /mnt/@ 1>/dev/null && printf "Created subvolume @"
btrfs subvolume create /mnt/@root 1>/dev/null && printf "Created subvolume @root"
btrfs subvolume create /mnt/@var 1>/dev/null && printf "Created subvolume @var"
btrfs subvolume create /mnt/@home 1>/dev/null && printf "Created subvolume @home"
btrfs subvolume create /mnt/@snapshots 1>/dev/null && printf "Created subvolume @snapshots"
umount /dev/sda2 && printf "Unmounted /dev/sda2"
mount -o subvol=@ /dev/sda2 /mnt 1>/dev/null && printf "Mounted subvolume @ on /mnt"
mkdir /mnt/.snapshots /mnt/home /mnt/root /mnt/var /mnt/boot 1>/dev/null && printf "Created directories in /mnt"
mount -o subvol=@root /dev/sda2 /mnt/root 1>/dev/null && printf "Mounted @root"
mount -o subvol=@home /dev/sda2 /mnt/home 1>/dev/null && printf "Mounted @home"
mount -o subvol=@var /dev/sda2 /mnt/var 1>/dev/null && printf "Mounted @var"
mount -o subvol=@snapshots /dev/sda2 /mnt/.snapshots 1>/dev/null && printf "Mounted @snapshots"
mount /dev/sda1 /mnt/boot 1>/dev/null && printf "Mounted ESP on /mnt/boot"
# Install packages
printf "Starting pacstrap for package installation, please be patient..."

while IFS= read -r line; do
	pacstrap /mnt $line 1>/dev/null && printf "Installed $line"
done < /etc/packages.x86_64
printf "Done iinstalling packages"
# fstab
genfstab -U /mnt >> /mnt/etc/fstab && printf "Generated fstab"
# Copy skel to FS
cp -r /etc/skel /mnt/etc/ && printf "Copied skeleton files over"
# copy chroot install over
cp chroot-install.sh /mnt/root/ && printf "Copied chroot-install script over"
printf "Please run arch-chroot /mnt and bash ./chroot-install.sh"
