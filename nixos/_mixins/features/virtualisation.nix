{ config, hostname, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop

    virt-manager
  ];

  virtualisation = {
    podman = {
      #defaultNetwork.settings.dns_enabled = true;
      dockerCompat = true;
      enable = true;
    };

    libvirtd = {
      enable = true;
    };

    # virtualbox.host = {
    #   enable = true;
    #   enableExtensionPack = true;
    # };
  };

  nixpkgs.config.allowUnfree = true;

  # Required for libvirtd
  programs.dconf.enable = true;
}
