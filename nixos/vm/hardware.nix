{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    ../_mixins/services/pipewire.nix
  ];

  # VM disk
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/root";
    fsType = "ext4";
    autoResize = true;
  };

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
