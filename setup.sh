#!/bin/bash
sudo pacman -S xdg-desktop-portal-hyprland
sudo pacman -R xdg-desktop-portal-gtk xdg-desktop-portal-gnome

# Displays
sudo pacman -Sy brigthnessctl

# Sound
sudo pacman -Syu pipewire pipewire-{jack,alsa,pulse} wireplumber

# Network
sudo pacman -Sy nm-connection-editor

# Bluetooth
sudo pacman -Sy bluez bluez-utils blueman polkit
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
systemctl status bluetooth.service

# USB stuff
sudo pacman -Sy usbutils
yay -Sy zsh stow

# Setup shortcuts to configs
stow alacritty
stow backgrounds
stow hypridle
stow hyprland
stow hyprlock
stow hyprpaper
# stow neofetch
stow waybar
stow wofi
stow ssh

systemctl --user enable --now ssh-agent

# sudo chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

yay -Sy neovim btop git lazygit lazydocker mise fd fzf lua luarocks tree-sitter-cli

./scripts/fonts.sh

# Hyprland & co
yay -Sy hyprland hyprshot hyprpaper hypridle hyprlock wayland waypaper swaync wlogout

# Apps
yay -Sy gimp obs-studio vlc localsend obsidian 1password
sudo pacman -Sy xournalpp

# Monitors (hotplug)
sudo pacman -Sy socat jq

yay -Sy nordvpn-gui
groupadd -r nordvpn
usermod -aG nordvpn $USER
sudo systemctl enable --now nordvpnd

# Setup languages
./languages/setup_node.sh
./languages/setup_ruby.sh
./languages/setup_dotnet.sh

gem install tmuxinator
wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh -O /usr/local/share/zsh/site-functions/_tmuxinator

# Setup Docker
# Install docker here
systemctl disable docker.service
systemctl enable docker.socket
