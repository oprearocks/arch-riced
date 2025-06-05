#!/bin/bash

yay -Sy zsh
# sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -Sy neovim btop git lazygit lazydocker mise fd fzf lua luarocks tree-sitter-cli

# Hyprland & co
yay -Sy hyprland hyprshot hyprpaper hypridle hyprlock wayland waypaper swaync

# Apps
yay -Sy gimp obs-studio vlc localsend

# Setup languages
./languages/setup_node.sh
./languages/setup_ruby.sh
