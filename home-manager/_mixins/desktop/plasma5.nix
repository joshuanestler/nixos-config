{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    layan-kde
    layan-gtk-theme
  ];
}
