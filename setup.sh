#!/bin/bash

yay -Sy zsh
# sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -Sy neovim btop git

./setup_docker.sh

yay -Sy hyprland hyprshot hyprpaper hypridle hyprlock wayland waypaper swaync

# Install apps

yay -Sy gimp obs-studio vlc

