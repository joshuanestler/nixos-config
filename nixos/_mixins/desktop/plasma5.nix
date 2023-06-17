{ inputs, pkgs, ... }: {
  imports = [
    ../services/networkmanager.nix
  ];

  # Exclude the Epiphany browser
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
  };

  services = {
    flatpak.enable = true;

    xserver = {
      enable = true;
      displayManager = {
        sddm = {
          enable = true;
          enableHidpi = true;
          theme = "";
        };
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
