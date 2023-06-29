{ hostname, lib, pkgs, ... }: {
  imports = [
    ./locale.nix
    ./nano.nix
    ../services/fwupd.nix
    ../services/virtualisation.nix
  ];

  environment.systemPackages = with pkgs; [
    binutils
    curl
    desktop-file-utils
    file
    git
    home-manager
    killall
    man-pages
    mergerfs
    mergerfs-tools
    nano
    pciutils
    rsync
    unzip
    usbutils
    v4l-utils
    wget
    xdg-utils
    icu # for .NET
  ];

  # Use passed in hostid and hostname to configure basic networking
  networking = {
    hostName = hostname;

    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
    };
  };

  programs = {
    dconf.enable = true;

    fish.enable = true;
  };

  security.rtkit.enable = true;
}
