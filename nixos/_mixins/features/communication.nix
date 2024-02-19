{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.teamspeak.TeamSpeak"
    "org.signal.Signal"
    "im.riot.Riot"
  ];
}
