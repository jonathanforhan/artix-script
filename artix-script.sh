#!/usr/bin/bash

sudo pacman -Syyu
source "$HOME/.bashrc"
sudo pacman -S --needed curl git vim neovim base-devel pass 

## Setup Git
gpg --gen-key
gpg --list-keys | awk '/^      /{print $1}' | xargs pass init "$1"
git config --global credential.credentialStore gpg
curl -L https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.1.2/gcm-linux_amd64.2.1.2.tar.gz | sudo tar zx -C "/usr/local/bin/"
git-credential-manager configure

## Setup AUR
git clone https://aur.archlinux.org/yay.git
sudo chown -R "$(whoami):users" yay && cd "$HOME/yay" && makepkg -si
cd "$HOME" && rm -rf "$HOME/yay"

## Setup GUI

## Setup Neovim
