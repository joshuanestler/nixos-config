{ inputs, desktopEnvironments, lib, pkgs, ... }: {
  imports = [
    ../base/pipewire.nix
    ../features/appimage.nix
    ../features/printing.nix
    ../features/multimedia.nix
    ../features/productivity.nix
    ../features/communication.nix
    ../features/obs.nix
    ../features/sane.nix
    ../features/yubico.nix
    ../../../modules/pcloud.nix
  ]
  # Include all desktop environments specified in the `desktopEnvironments` list.
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
    # inputs.nix-software-center.packages.${system}.nix-software-center
    timeshift
    gparted

    protonmail-bridge
  ];

  # programs.ssh.askPassword = lib.mkForce "${pkgs.x11_ssh_askpass}/libexec/x11-ssh-askpass";
}
