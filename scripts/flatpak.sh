#!/usr/bin/env bash

echo "Installing Flatpak apps"

# Add Flathub repository
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

###### Apps ######

flatpak install -y --user flathub com.github.tchx84.Flatseal

# Multimedia
flatpak install -y --user flathub com.spotify.Client
flatpak install -y --user flathub org.videolan.VLC
flatpak install -y --user flathub org.blender.Blender
flatpak install -y --user flathub org.gimp.GIMP

# Productivity
flatpak install -y --user flathub com.brave.Browser
flatpak install -y --user flathub org.mozilla.Thunderbird
flatpak install -y --user flathub com.ulduzsoft.Birdtray
flatpak install -y --user flathub com.obsproject.Studio
flatpak install -y --user flathub org.remmina.Remmina
flatpak install -y --user flathub org.gnome.Boxes
flatpak install -y --user flathub org.keepassxc.KeePassXC

# Communication
flatpak install -y --user flathub com.discordapp.Discord
flatpak install -y --user flathub com.teamspeak.TeamSpeak
flatpak install -y --user flathub org.signal.Signal
flatpak install -y --user flathub io.github.mimbrero.WhatsAppDesktop
flatpak install -y --user flathub im.riot.Riot

# Gaming
flatpak install -y --user flathub com.valvesoftware.Steam
flatpak install -y --user flathub org.prismlauncher.PrismLauncher
flatpak install -y --user flathub com.heroicgameslauncher.hgl
flatpak install -y --user flathub com.usebottles.bottles



