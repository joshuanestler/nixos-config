{ lib, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./locale.nix
    ./networking.nix
    ./packages.nix
    ./ssh.nix
    ../features/nano.nix
    ../features/virtualisation.nix
  ];
}
