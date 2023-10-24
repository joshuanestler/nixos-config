{ config, lib, pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    # unstable.yubioath-flutter
  ];

  # Install authenticator with flatpak
  systemd.services.install-yubico = {
    description = "Install Yubico Authenticator";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${flatpak.flatpakInstallCommandDefault} com.yubico.yubioath";
    };
  };
}
