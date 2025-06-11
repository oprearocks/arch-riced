cat <<EOF >~/.local/share/applications/Spotify.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Spotify
Exec=$(which google-chrome-stable) --profile-directory=Default --app-id=pjibgclleladliembfgfagdaldikeohf
Icon=/home/$USER/dotfiles/applications/icons/Spotify.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF
