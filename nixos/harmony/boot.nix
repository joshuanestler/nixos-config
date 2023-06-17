{ config, lib, pkgs, ... }: {
  boot = {
    blacklistedKernelModules = lib.mkDefault [ "nouveau" ];
    consoleLogLevel = 3;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    extraModprobeConfig = lib.mkDefault ''
      blacklist nouveau
      options v4l2loopback devices=1 video_nr=13 card_label="OBS Virtual Camera" exclusive_caps=1
    '';
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "uas"
        "usbhid"
        "sd_mod"
        "xhci_pci"
      ];
      kernelModules = [ ];
      verbose = false;
    };

    kernelModules = [
      "kvm-intel"
      "nvidia"
      "vhost_vsock"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = [ "btrfs" "ext4" "fat" "vfat" ];

    loader = {
      efi.canTouchEfiVariables = true;

      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        device = "nodev";
        default = "saved";
        gfxmodeEfi = "1920x1080";
        gfxmodeBios = "1920x1080";
      };

      timeout = 10;
    };
  };
}
