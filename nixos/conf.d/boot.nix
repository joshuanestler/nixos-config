{ config, pkgs, ... }:

{
  # boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    useOSProber = true;
    device = "nodev";
    default = "saved";
    gfxmodeEfi = "1920x1080";
    gfxmodeBios = "1920x1080";
  };

  boot.supportedFilesystems = [ "ext4" "ntfs" "btrfs" "fat32" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
