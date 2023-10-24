{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  systemd.services.install-poductivity = {
    description = "Install Productivity flatpaks";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${flatpak.flatpakInstallCommandDefault} \
        com.brave.Browser \
        org.mozilla.Thunderbird \
        com.ulduzsoft.Birdtray \
        org.remmina.Remmina \
        org.keepassxc.KeePassXC \
        com.usebottles.bottles \
        com.logseq.Logseq \
      '';
    };
  };
}
