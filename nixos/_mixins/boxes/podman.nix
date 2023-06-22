{ config, lib, pkgs, ... }: {
  #https://nixos.wiki/wiki/Podman

  environment.systemPackages = with pkgs; [
    buildah
    podman-compose
    podman-tui
    podman-desktop
  ];
  virtualisation = {
    podman = {
      #defaultNetwork.settings.dns_enabled = true;
      dockerCompat = true;
      enable = true;
      enableNvidia = lib.elem "nvidia" config.services.xserver.videoDrivers;
    };
  };
}
