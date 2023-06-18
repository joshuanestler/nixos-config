{ desktop, pkgs, ... }: {
  imports = [
    ../services/cups.nix
    ../services/flatpak.nix
    ../services/sane.nix
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

  environment.systemPackages = with pkgs; [
  ];
}
