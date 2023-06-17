{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Include packages
  environment.systemPackages = with pkgs.libsForQt5; [
    lightly
    filelight
  ];

  # Exclude packages
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    oxygen
    khelpcenter
  ];

  # Enable KDE Connect.
  programs.kdeconnect.enable = true;
}
