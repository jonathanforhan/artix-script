#!/usr/bin/bash

sudo pacman -Syyu
source "$HOME/.bashrc"

## Setup Git
sudo pacman -S git gpg pass
gpg --gen-key
pass init

## Setup AUR

## Setup GUI

# sudo pacman -S xorg-server xorg-xinit xorg-xsetroot

## Setup Neovim
