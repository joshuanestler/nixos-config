{ config, lib, pkgs, ... }:
with lib.hm.gvariant;
{
  home.packages = with pkgs; [
    gnome.gnome-software
  ];
}
