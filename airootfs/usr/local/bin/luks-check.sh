#!/bin/sh
device=$1
sudo cryptsetup luksOpen --test-passphrase /dev/$device && echo "Success"
