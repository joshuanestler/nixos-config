{ config, lib, pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;

    growPartition = true;
    kernelParams = [ "console=ttyS0 boot.shell_on_fail" ];

    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" "ext4" "fat" "vfat" ];

    virtualisation = {
      diskSize = 50000;
      memorySize = 4096;

      qemu.options = [
        "-virtfs local,path=${mount_host_path},security_model=none,mount_tag=${mount_tag}"
      ];

      writableStoreUseTmpfs = false;

      useBootLoader = true;
    };
  };
}
