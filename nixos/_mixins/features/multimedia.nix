{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  systemd.services.install-multimedia = {
    description = "Install Multimedia flatpaks";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${flatpak.flatpakInstallCommandDefault} \
        com.spotify.Client \
        org.videolan.VLC \
        org.blender.Blender \
        org.gimp.GIMP \
      '';
    };
  };
}
