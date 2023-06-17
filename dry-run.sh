#!/bin/sh

# Backup the current version

# ZIP folder /etc/nixos/ and copy to ./backups/
backup_dir="./backups"
backup_file="etc-nixos-$(date +%Y-%m-%d-%H-%M-%S).zip"
dir=$(pwd)


if [ ! -d "$backup_dir" ]; then
    mkdir "$backup_dir"
fi


cd /etc/nixos || exit
zip -rJ "$dir/$backup_dir/$backup_file" ./*
cd "$dir" || exit

# Copy the new version

sudo cp -rf ./nixos/* /etc/nixos/

sudo nixos-rebuild dry-activate

sudo unzip -o "$backup_dir/$backup_file" -d /etc/nixos/
