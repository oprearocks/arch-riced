#!/bin/bash

yay -Sy zsh hyprland hyprshot hyprpaper hypridle hyprlock wayland waypaper swaync
sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install apps

yay -Sy gimp obs-studio vlc

