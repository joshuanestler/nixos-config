{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  systemd.services.install-communication = {
    description = "Install Communication flatpaks";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${flatpak.flatpakInstallCommandDefault} \
        com.discordapp.Discord \
        com.teamspeak.TeamSpeak \
        org.signal.Signal \
        im.riot.Riot \
      '';
    };
  };
}
