{ pkgs, ... }:
{
  flatpakInstallCommand = "${pkgs.flatpak}/bin/flatpak install -y --noninteractive --or-update";
  flatpakInstallCommandDefault = "${pkgs.flatpak}/bin/flatpak install -y --noninteractive --or-update flathub";

  services.flatpak.enable = true;
  xdg.portal.enable = true;
  #xdg.portal.xdgOpenUsePortal = true;

  # Install base desktop environment packages.
  systemd.services.flatpak-install-base = {
    description = "Install base flatpak packages";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      
        flatpak install -y --noninteractive --or-update flathub com.github.tchx84.Flatseal
      '';
    };
  };
}
