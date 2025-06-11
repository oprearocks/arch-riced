#!/bin/bash
sudo pacman -S xdg-desktop-portal-hyprland
sudo pacman -R xdg-desktop-portal-gtk xdg-desktop-portal-gnome

# Displays
sudo pacman -Sy brigthnessctl

# Sound
sudo pacman -Syu pipewire pipewire-{jack,alsa,pulse} wireplumber

# Network
sudo pacman -Synm-connection-editor

# Bluetooth
sudo pacman -Sy bluez bluez-utils blueman polkit
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
systemctl status bluetooth.service

yay -Sy zsh stow

# Setup shortcuts to configs
stow alacritty
stow backgrounds
stow hypridle
stow hyprland
stow hyprlock
stow hyprpaper
stow neofetch
stow waybar
stow wofi

# sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -Sy neovim btop git lazygit lazydocker mise fd fzf lua luarocks tree-sitter-cli

# Fonts
yay -Sy ttf-ms-fonts ttf-google-fonts-git xorg-fonts-100dpi
# Hyprland & co
yay -Sy hyprland hyprshot hyprpaper hypridle hyprlock wayland waypaper swaync wlogout

# Apps
yay -Sy gimp obs-studio vlc localsend obsidian 1password

yay -Sy nordvpn-gui
groupadd -r nordvpn
usermod -aG nordvpn $USER
sudo systemctl enable --now nordvpnd

# Setup languages
./languages/setup_node.sh
./languages/setup_ruby.sh

# Setup Docker
# Install docker here
systemctl disable docker.service
systemctl enable docker.socket
