#!/usr/bin/bash

[[ -f ~/.bashrc ]] && . "$HOME/.bashrc"

[ "$TERM" == "linux" ] && startx
. "$HOME/.cargo/env"
