{ pkgs, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  services.flatpak.packages = [
    "com.spotify.Client"
    "org.videolan.VLC"
    "org.blender.Blender"
    "org.gimp.GIMP"
  ];
}
