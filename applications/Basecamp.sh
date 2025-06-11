cat <<EOF >~/.local/share/applications/Basecamp.desktop
[Desktop Entry]
Version=1.0
Name=Basecamp
Comment=Basecamp Project Management
Exec=$(which google-chrome-stable) --app="https://launchpad.37signals.com" --name=Basecamp --class=Basecamp
Terminal=false
Type=Application
Icon=/home/$USER/dotfiles/applications/icons/Basecamp.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
