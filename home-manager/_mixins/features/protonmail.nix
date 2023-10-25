{ config, pkgs, username, ... }:
{
  home.packages = with pkgs; [
    protonmail-bridge
  ];

  systemd.user.services."protonmail-bridge" = {
    Unit = {
      Description = "ProtonMail Bridge";
    };

    Service = {
      Type = "simple";
      Restart = "always";
      RestartSec = 5;
      User = username;
      ExecStart = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive --log-level info";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
  };
}