{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
}
