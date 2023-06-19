{ desktop, pkgs, ... }: {
  imports = [
    ../services/cups.nix
    ../services/flatpak.nix
    ../services/sane.nix
    ../services/yubico.nix
    (./. + "/${desktop}.nix")
  ];

  # boot.kernelParams = [ "quiet" ];
  # boot.plymouth.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      cascadia-code
    ];
  };

  # BSPWM
  services.xserver.windowManager.bspwm.enable = true;


  environment.systemPackages = with pkgs; [
    pcloud
  ];
}
