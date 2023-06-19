# This file defines overlays
{ nixpkgs, inputs, ... }:
let
  pkgs-pcloud-ok = import inputs.nixpkgs-unstable-pcloud-ok {
    system = pkgs.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    pcloud = pkgs-pcloud-ok.pcloud;
    # Cryptomator 1.8 doesn't work.
    # FUSE mount doesn't work.
    cryptomator = pkgs-pcloud-ok.cryptomator;
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
