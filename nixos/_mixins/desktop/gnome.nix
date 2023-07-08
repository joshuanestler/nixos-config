{ inputs, pkgs, ... }: {
  environment = {

    systemPackages = with pkgs; [
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
        gnome = {
          enable = true;
        };
      };
    };
  };
}
