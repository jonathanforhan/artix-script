#!/usr/bin/bash

sudo pacman -Syyu
source "$HOME/.bashrc"

## Setup Git
sudo pacman -S git gpg pass
gpg --gen-key
gpg --list-keys | awk '/^      /{print }' | xargs pass init 
git config --global credentialStore gpg

## Setup AUR

## Setup GUI

# sudo pacman -S xorg-server xorg-xinit xorg-xsetroot

## Setup Neovim
