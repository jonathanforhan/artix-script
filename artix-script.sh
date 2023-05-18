#!/usr/bin/bash

sudo pacman -Syyu
source "$HOME/.bashrc"
sudo pacman -S curl git gpg pass

## Setup Git
gpg --gen-key
gpg --list-keys | awk '/^      /{print $1}' | xargs pass init
git config --global credentialStore gpg
curl -L https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.1.2/gcm-linux_amd64.2.1.2.tar.gz | tar zx -C "/usr/local/bin/"
git-credential-manager configure

## Setup AUR

## Setup GUI

## Setup Neovim
