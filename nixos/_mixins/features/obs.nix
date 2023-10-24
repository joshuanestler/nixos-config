{ config, pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  # Enable V4L2 loopback device and kernel module
  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  # Install OBS flatpak via systemd one-shot service
  systemd.services.install-obs = {
    description = "Install OBS flatpak";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${flatpak.flatpakInstallCommandDefault} com.obsproject.Studio";
    };
  };
}
