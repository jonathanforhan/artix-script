#!/usr/bin/bash

sudo pacman -Syyu
source "$HOME/.bashrc"
sudo pacman -S --needed curl git neovim tmux base-devel pass figlet

## Setup Git
figlet -ckt 'Git Setup'
echo "Setting up git-credential-manager..."
gpg --gen-key
gpg --list-keys | awk '/^      /{print $1}' | xargs pass init "$1"
git config --global credential.credentialStore gpg
curl -L https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.1.2/gcm-linux_amd64.2.1.2.tar.gz | sudo tar zx -C "/usr/local/bin/"
git-credential-manager configure
echo "Linking Github account info"
read -p "Github username: " git_name
git config --global user.name "$git_name"
read -p "Github email: " git_email
git config --global user.email "$git_email"
git config --global credential.guiPrompt false

## Setup AUR
figlet -ckt 'AUR Setup'
git clone https://aur.archlinux.org/yay.git
sudo chown -R "$(whoami):users" yay && cd "$HOME/yay" && makepkg -si
cd "$HOME" && rm -rf "$HOME/yay"

## Setup Configs
tmux source "$HOME/.config/tmux/tmux.conf"

## Setup KVM

## Setup GUI

