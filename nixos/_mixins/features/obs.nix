{ config, pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  # Enable V4L2 loopback device and kernel module
  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  services.flatpak.packages = [
    "com.obsproject.Studio"
  ];
}
