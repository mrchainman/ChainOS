#!/bin/sh
rm ~/.local/share/nvim/swap/* &&
notify-send "Deleted Neovim swapfiles" ||
notify-send "No Neovim swapfiles to remove!"

