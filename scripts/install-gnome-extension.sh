#!/bin/bash

install_extension() {
    UUID="$1"
    echo "Instalando extensión: $UUID"

    EXT_ID=$(curl -s "https://extensions.gnome.org/extension-query/?search=$UUID" | grep -oP '"pk":\K\d+' | head -n 1)

    if [ -z "$EXT_ID" ]; then
        echo "❌ No se encontró el UUID: $UUID"
        return
    fi

    VERSION=$(gnome-shell --version | grep -oP '\d+\.\d+')
    DL_URL=$(curl -s "https://extensions.gnome.org/extension-info/?pk=$EXT_ID&shell_version=$VERSION" | grep -oP '"download_url":\s*"\K[^"]+')

    if [ -z "$DL_URL" ]; then
        echo "❌ No hay versión compatible para GNOME $VERSION"
        return
    fi

    mkdir -p ~/.local/share/gnome-shell/extensions/"$UUID"
    curl -sL "https://extensions.gnome.org$DL_URL" -o /tmp/ext.zip
    unzip -q /tmp/ext.zip -d ~/.local/share/gnome-shell/extensions/"$UUID"

    gnome-extensions enable "$UUID"
    echo "✅ $UUID instalado y habilitado"
}

EXTENSIONS=(
	just-perfection-desktop@just-perfection,
	space-bar@lichrioh,
	tactile@lundial.io,
	tophat@fflewddur.github.io,
	switcher@landau.fi
)

for UUID in "${EXTENSIONS[@]}"; do
    install_extension "$UUID"
done

