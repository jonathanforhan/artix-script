#!/usr/bin/bash

sudo pacman -Syu
source "$HOME/.bashrc"
sudo pacman -S --needed curl git figlet

confirmation() {
    read -p "Do you wish to setup $1? [Y/n] " opt
    if [[ $opt == 'Y' || $opt == 'y' || -z $opt ]]; then
        echo "yes"
    else
        echo "no"
    fi
}

GIT=0
AUR=0
NODEJS=0
RUST=0
PYTHON=0
PERL=0
RUBY=0
NVIM=0
TMUX=0

## Setup Git
figlet -ct 'Git  Setup'
if [[ $(confirmation "git") == "yes" ]]; then
    $GIT=1
    echo "Setting up git-credential-manager..."
    sudo pacman -S --needed pass
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
    $AUR=1
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/yay.git
    sudo chown -R "$(whoami):users" yay && cd "$HOME/yay" && makepkg -si
    cd "$HOME" && rm -rf "$HOME/yay"
fi

## Setup Nodejs
figlet -ct 'Nodejs  Setup'
if [[ $(confirmation "nodejs") == "yes" ]]; then
    $NODEJS=1
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    . .bashrc
    nvm install node
    sudo npm -g i neovim
fi

## Setup Rust
figlet -ct 'Rust  Setup'
if [[ $(confirmation "rust") == "yes" ]]; then
    $RUST=1
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

## Setup Python
figlet -ct 'Python  Setup'
if [[ $(confirmation "python") == "yes" ]]; then
    $PYTHON=1
    sudo pacman -S python-pip python-virtualenv
    pip install neovim
fi

## Setup Perl
figlet -ct 'Perl Setup'
if [[ $(confirmation "perl") == "yes" ]]; then
    $PERL=1
    curl -L http://cpanmin.us | perl - --sudo App::cpanminus    
    cpanm --local-lib=~/.local/share/perl5 local::lib && eval $(eval -I ~/.local/share/perl5 -Mlocal::lib)
    . .bashrc
    cpanm install local::lib
    cpanm install Neovim::Ext
fi

## Setup Ruby
figlet -ct 'Ruby Setup'
if [[ $(confirmation "ruby") == "yes" ]]; then
    $RUBY=1
    sudo pacman -S ruby
fi

## Setup Neovim
figlet -ct 'Neovim  Setup'
if [[ $(confirmation "neovim") == "yes" ]]; then
    $NVIM=1
    sudo pacman -S --needed neovim
    [[ $AUR==1 ]] && yay -S gdu-bin
fi

## Setup Tmux
figlet -ct 'Tmux  Setup'
if [[ $(confirmation "tmux") == "yes" ]]; then
    $TMUX=1
    sudo pacman -S --needed tmux
    git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
    tmux new-session -d -s config
    tmux source "$HOME/.config/tmux/tmux.conf"
    "$HOME/.config/tmux/plugins/tpm/scripts/install_plugins.sh"
    tmux kill-server
fi

## Setup GUI
