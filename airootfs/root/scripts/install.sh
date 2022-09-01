#!/bin/bash
######################################################
######################################################
############## CHAIN OS INSTALL SCRIPT ###############
######################################################
######################################################
printf "Please enter your Diskname:\n"
read disk
loadkeys us
ls /sys/firmware/efi/efivars 1>/dev/null &&
echo "Running in UEFI Mode\n"
ping -c 4 archlinux.org 1>/dev/null &&
echo "Online" || (echo "Offline, exiting...\n"& exit 0)
timedatectl set-ntp true &&
timedatectl status
parted -s /dev/$disk mklabel gpt &&
printf "Set Label to GPT" || ( printf "Faliled to set Label... exiting\n"& exit 0)
parted -s /dev/$disk mkpart ESP fat32 2MiB 500MiB &&
printf "Created ESP partition" || ( printf "Faliled to create ESP partition... exiting\n"& exit 0)
parted -s /dev/$disk mkpart System btrfs 510MiB 100% &&
printf "Created System partition" || ( printf "Faliled to create System partition... exiting\n"& exit 0)
mkfs.fat /dev/$disk1 &&
printf "Created fat FS" || ( printf "Failed to create fat FS exiting...\n"& exit 0 )
mkfs.btrfs /dev/$disk2 &&
printf "Created btrfs FS" || ( printf "Failed to create btrfs FS exiting...\n"& exit 0 )
mount /dev/$disk2 /mnt 1>/dev/null &&
printf "Mounted /dev/$disk2 on /mnt\n"
btrfs subvolume create /mnt/@ 1>/dev/null &&
printf "Created subvolume @\n"
btrfs subvolume create /mnt/@root 1>/dev/null &&
printf "Created subvolume @root\n"
btrfs subvolume create /mnt/@var 1>/dev/null &&
printf "Created subvolume @var\n"
btrfs subvolume create /mnt/@home 1>/dev/null &&
printf "Created subvolume @home\n"
btrfs subvolume create /mnt/@snapshots 1>/dev/null &&
printf "Created subvolume @snapshots\n"
umount /dev/$disk2 &&
printf "Unmounted /dev/$disk2\n"
mount -o subvol=@ /dev/$disk2 /mnt 1>/dev/null &&
printf "Mounted subvolume @ on /mnt\n"
mkdir /mnt/.snapshots /mnt/home /mnt/root /mnt/var /mnt/boot 1>/dev/null &&
printf "Created directories in /mnt\n"
mount -o subvol=@root /dev/$disk2 /mnt/root 1>/dev/null &&
printf "Mounted @root\n"
mount -o subvol=@home /dev/$disk2 /mnt/home 1>/dev/null &&
printf "Mounted @home\n"
mount -o subvol=@var /dev/$disk2 /mnt/var 1>/dev/null &&
printf "Mounted @var\n"
mount -o subvol=@snapshots /dev/$disk2 /mnt/.snapshots 1>/dev/null &&
printf "Mounted @snapshots\n"
mount /dev/$disk1 /mnt/boot 1>/dev/null &&
printf "Mounted ESP on /mnt/boot\n"
printf "Starting pacstrap ...\n"
pacstrap /mnt base base-devel linux-zen &&
printf "Finished pacstrap\n"
genfstab -U /mnt >> /mnt/etc/fstab &&
printf "Generated fstab\n"
cp -r /etc/skel /mnt/etc/ &&
printf "Copied skeleton files into chroot\n"
cp chroot-install.sh /mnt/root/ &&
cp -r ../packages &&
printf "Copied scripts into chroot\n"
printf "Please run arch-chroot /mnt and bash ./chroot-install.sh\n"
