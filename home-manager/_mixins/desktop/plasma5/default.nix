{ config, desktopEnvironments, additionalFeatures, hostname, inputs, lib, modulesPath, outputs, pkgs, stateVersion, username, ... }: {
  
  imports = [
    ./plasma5.nix
    ./config.nix
    ./dolphin.nix
    ./spectacle.nix
  ];
}