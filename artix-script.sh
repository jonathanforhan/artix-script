#!/usr/bin/bash

sudo pacman -Syu
source "$HOME/.bashrc"
sudo pacman -S --needed curl git neovim tmux base-devel pass figlet

confirmation() {
    read -p "Do you wish to setup $1? [Y/n] " opt
    if [[ $opt == 'Y' || $opt == 'y' || -z $opt ]]; then
        echo "yes"
    else
        echo "no"
    fi
}

## Setup Git
figlet -ct 'Git  Setup'
if [[ $(confirmation "git") == "yes" ]]; then
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
fi

## Setup AUR
figlet -ct 'AUR  Setup'
if [[ $(confirmation "the AUR") == "yes" ]]; then
    git clone https://aur.archlinux.org/yay.git
    sudo chown -R "$(whoami):users" yay && cd "$HOME/yay" && makepkg -si
    cd "$HOME" && rm -rf "$HOME/yay"
fi

## Setup Tmux
figlet -ct 'Tmux  Setup'
if [[ $(confirmation "tmux") == "yes" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
    tmux new-session -d -s config
    tmux source "$HOME/.config/tmux/tmux.conf"
    "$HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh"
    tmux kill-server
fi

## Setup Nodejs
figlet -ct 'Nodejs  Setup'
if [[ $(confirmation "nodejs") == "yes" ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    nvm install node
fi

## Setup GUI

