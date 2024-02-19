{ config, lib, pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    # unstable.yubioath-flutter
  ];

  services.flatpak.packages = [
    "com.yubico.yubioath"
  ];
}
