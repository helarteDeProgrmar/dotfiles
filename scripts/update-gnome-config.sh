# https://flathub.org/apps/com.mattjakeman.ExtensionManager
dconf dump /org/gnome/desktop/ > windows.txt
dconf dump /org/gnome/shell/extensions/ > extension.txt
dconf dump /org/gnome/settings-daemon/plugins/ > shortcuts.txt
