{ inputs, pkgs, ... }: {
  imports = [
    ../features/networkmanager.nix
  ];

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      elisa
      oxygen
      khelpcenter
    ];

    systemPackages = with pkgs; [
      libsForQt5.lightly
      libsForQt5.filelight
      layan-kde
      layan-gtk-theme
      sddm-kcm
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
        sddm = {
          enable = true;
          autoNumlock = true;
        };
      };

      desktopManager = {
        plasma5 = {
          enable = true;
          notoPackage = pkgs.noto-fonts;
          phononBackend = "vlc";
          runUsingSystemd = true;
          useQtScaling = true;
        };
      };
    };
  };
}
