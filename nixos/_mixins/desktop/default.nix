{ inputs, desktopEnvironments, lib, pkgs, ... }: {
  imports = [
    ../features/cups.nix
    ../features/flatpak.nix
    ../features/obs.nix
    ../features/sane.nix
    ../features/yubico.nix
    ../../../modules/pcloud.nix
  ]
  ++ (map (element: (./. + "/${element}.nix")) desktopEnvironments);

  # boot.kernelParams = [ "quiet" ];
  # boot.plymouth.enable = true;

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      cascadia-code
    ];
  };

  environment.systemPackages = with pkgs; [
    pcloud
    inputs.nix-software-center.packages.${system}.nix-software-center
    timeshift
    gparted
  ];

  programs.ssh.askPassword = lib.mkForce "${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";
}
