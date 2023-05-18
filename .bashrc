#!/usr/bin/bash
#                     _                  _                                     #
#                    | |__    __ _  ___ | |__   _ __  ___                      #
#                    | '_ \  / _` |/ __|| '_ \ | '__|/ __|                     #
#                    | |_) || (_| |\__ \| | | || |  | (__                      #
#                    |_.__/  \__,_||___/|_| |_||_|   \___|                     #
#                                                                              #

export PS1="\[\033[38;5;41m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;41m\]\h\[$(tput sgr0)\]:[\[$(tput sgr0)\]\[\033[38;5;39m\]\W\[$(tput sgr0)\]]\\$ \[$(tput sgr0)\]"
export EDITOR="nvim"
export GPG_TTY=$(tty) # gpg git-credential
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(perl -I$HOME/.local/share/perl5/lib/perl5 -Mlocal::lib=$HOME/.local/share/perl5)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#                             _  _                                             #
#                       __ _ | |(_)  __ _  ___   ___  ___                      #
#                      / _` || || | / _` |/ __| / _ \/ __|                     #
#                     | (_| || || || (_| |\__ \|  __/\__ \                     #
#                      \__,_||_||_| \__,_||___/ \___||___/                     #
#                                                                              #
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'
alias l='LC_COLLATE=C ls -l'
alias ll='LC_COLLATE=C ls -la'

alias v='nvim'
alias py='python3'
alias docker='sudo docker'

alias imgcp="xclip -selection clipboard -t image/png -i"

#                                         _    _                               #
#                           _ __    __ _ | |_ | |__                            #
#                          | '_ \  / _` || __|| '_ \                           #
#                          | |_) || (_| || |_ | | | |                          #
#                          | .__/  \__,_| \__||_| |_|                          #
#                          |_|                                                 #
#                                                                              #
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.scripts/cmaker:$PATH"
#. "$HOME/.cargo/env"
