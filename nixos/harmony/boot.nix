{ config, lib, pkgs, ... }: {
  boot = {
    consoleLogLevel = 3;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    initrd = {
      availableKernelModules = [
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "xhci_pci"
      ];
      verbose = false;
    };

    # Enable TTYs
    kernelParams = [
      "console=tty1"
    ];

    kernelModules = [
      "kvm-intel"
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
