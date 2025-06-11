cat <<EOF >~/.local/share/applications/HEY.desktop
[Desktop Entry]
Version=1.0
Name=HEY
Comment=HEY Email + Calendar
Exec=$(which google-chrome-stable) --app="https://app.hey.com/" --name=HEY --class=HEY
Terminal=false
Type=Application
Icon=/home/$USER/dotfiles/applications/icons/HEY.png
Categories=GTK;
MimeType=x-scheme-handler/mailto
StartupNotify=true
EOF
