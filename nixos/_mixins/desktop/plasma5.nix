{ inputs, pkgs, ... }: {
  imports = [
    ../services/networkmanager.nix
  ];

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      oxygen
      khelpcenter
    ];

    systemPackages = with pkgs.libsForQt5; [
      lightly
      filelight
    ];
  };

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm.enable = true;
      };

      desktopManager = {
        plasma5 = {
          enable = true;
          notoPackage = pkgs.noto-fonts;
          phononBackend = "vlc";
          runUsingSystemd = true;
          useQtScaling = false;
        };
      };
    };
  };
}
