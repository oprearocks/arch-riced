cat <<EOF >~/.local/share/applications/Teams.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Microsoft Teams
Exec=$(which google-chrome-stable) "--profile-directory=Profile 1" --app-id=cifhbcnohmdccbgoicgdjpfamggdegmo
Icon=/home/$USER/dotfiles/applications/icons/Teams.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
