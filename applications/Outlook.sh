cat <<EOF >~/.local/share/applications/Outlook.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Outlook
MimeType=x-scheme-handler/mailto
Exec=$(which google-chrome-stable) "--profile-directory=Profile 1" --app-id=faolnafnngnfdaknnbpnkhgohbobgegn %U
Icon=/home/$USER/dotfiles/applications/icons/Outlook.png
Categories=GTK;
StartupNotify=true
Actions=New-event;New-message;Open-calendar

[Desktop Action New-event]
Name=New event
Exec=$(which google-chrome-stable) "--profile-directory=Profile 1" --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar/deeplink/compose

[Desktop Action New-message]
Name=New message
Exec=$(which google-chrome-stable) "--profile-directory=Profile 1" --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/mail/deeplink/compose

[Desktop Action Open-calendar]
Name=Open calendar
Exec=$(which google-chrome-stable) "--profile-directory=Profile 1" --app-id=faolnafnngnfdaknnbpnkhgohbobgegn --app-launch-url-for-shortcuts-menu-item=https://outlook.office.com/calendar
EOF
