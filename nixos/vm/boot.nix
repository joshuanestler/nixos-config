{ config, lib, pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;

    growPartition = true;
    kernelParams = [ "console=ttyS0" "boot.shell_on_fail" ];

    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" "ext4" "fat" "vfat" ];

    loader.grub = {
      enable = true;
      device = "nodev";
    };
  };
}
