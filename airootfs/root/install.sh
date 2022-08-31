#!/bin/bash
######################################################
######################################################
############## CHAIN OS INSTALL SCRIPT ###############
######################################################
######################################################
# Keymap
loadkeys us
# Check if booted in efi
ls /sys/firmware/efi/efivars && echo "Running in UEFI Mode"
# Test internet
ping -c 4 archlinux.org && echo "Online" || (echo "Offline, exiting..." && exit 0)
# Set time
timedatectl set-ntp true && timedatectl status
# Prepare partitions
parted -s /dev/sda mklabel gpt && printf "Set Label to GPT" || ( printf "Faliled to set Label... exiting" && exit 0)
parted -s /dev/sda mkpart ESP fat32 2MiB 500MiB && printf "Created ESP partition" || ( printf "Faliled to create ESP partition... exiting" && exit 0)
parted -s /dev/sda mkpart System btrfs 510MiB 100% && printf "Created System partition" || ( printf "Faliled to create System partition... exiting" && exit 0)
# Make filesystems
mkfs.fat /dev/sda1
mkfs.btrfs /dev/sda2
# Mount
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@var
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
umount /dev/sda2
mount -o subvol=@ /dev/sda2 /mnt
mkdir /mnt/.snapshots /dev/sda2 /mnt/home /mnt/root /mnt/var /mnt/boot
mount -o subvol=@root /dev/sda2 /mnt/root
mount -o subvol=@home /dev/sda2 /mnt/home
mount -o subvol=@var /dev/sda2 /mnt/var
mount -o subvol=@snapshots /dev/sda2 /mnt/.snapshots
mount /dev/sda1 /mnt/boot
# Install packages
pacstrap /mnt < /etc/packages.x86_64
# fstab
genfstab -U /mnt >> /mnt/etc/fstab
# Basics
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "chainos" > /etc/hostname
printf "Please enter the root password:\n"
passwd && printf "Changed root password"
bootctl install || efibootmgr --create --disk /dev/sda --part 2 --loader "\EFI\systemd\systemd-bootx64.efi" --label "Linux Boot Manager" --verbose
ln -sf /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service
exit
cp -r /etc/skel /mnt/etc/
printf "All done!\nYou can now reboot"
