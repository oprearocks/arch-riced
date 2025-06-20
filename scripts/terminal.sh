#!/bin/bash

yay -Sy fzf ripgrep eza zoxide plocate apache-tools fd tldr
sudo pacman -S bat fastfetch

stow fastfetch
eval "$(zoxide init zsh)"
