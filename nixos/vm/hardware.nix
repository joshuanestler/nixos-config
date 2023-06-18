{ config, inputs, lib, pkgs, username, ... }:

{
  imports = [
    ../_mixins/services/pipewire.nix
  ];

  services.qemuGuest.enable = true;

  # VM disk
  fileSystems."/" = {
    device = "/dev/disk/by-partlabel/root";
    fsType = "btrfs";
    autoResize = true;
  };

  networking.useDHCP = lib.mkDefault true;
}
