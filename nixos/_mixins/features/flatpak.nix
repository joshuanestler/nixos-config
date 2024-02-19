{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  services.flatpak.packages = [
    "org.freedesktop.Sdk.Extension.dotnet8"
    "org.freedesktop.Sdk.Extension.node18"

    "com.google.AndroidStudio"
    "com.jetbrains.Rider"
    "rest.insomnia.Insomnia"
  ];
}

