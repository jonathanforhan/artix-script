#!/usr/bin/bash
#                            _         _  _                                    #
#                     __  __(_) _ __  (_)| |_  _ __  ___                       #
#                     \ \/ /| || '_ \ | || __|| '__|/ __|                      #
#                      >  < | || | | || || |_ | |  | (__                       #
#                     /_/\_\|_||_| |_||_| \__||_|   \___|                      #
#                                                                              #

[[ -f ~/.Xresources ]] && xrdb -merge -I"$HOME" ~/.Xresources
while type dwm >/dev/null; do dwm && continue; break; done
