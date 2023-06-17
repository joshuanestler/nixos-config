{ config, desktop, lib, pkgs, ... }:

let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nekanu = {
    isNormalUser = true;
    description = "Nekanu";
    extraGroups = [
      "networkmanager"
      "wheel"
    ]
    ++ ifExists [
      "docker"
      "vboxusers"
    ];
    createHome = true;

    packages = with pkgs; [
      home-manager
      firefox
    ];
  };
}
