{ config, desktop, lib, pkgs, ... }:
let
  ifExists = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  # Only include desktop components if one is supplied.
  imports = [
    ./packages-console.nix
  ] ++ lib.optional (builtins.isString desktop) ./packages-desktop.nix;

  users.users.nekanu = {
    description = "Nekanu";
    extraGroups = [
      "audio"
      "networkmanager"
      "users"
      "video"
      "wheel"
    ]
    ++ ifExists [
      "docker"
      "podman"
      "vboxusers"
    ];
    # mkpasswd -m sha-512
    hashedPassword = "$y$j9T$ENNuzed4KTBwkim/kZdz.1$F2B.I7CWGmZOYYWBhTdHz8TmbyON7ZshktYD8/pqPE/";
    isNormalUser = true;
    openssh.authorizedKeys.keys = [ ];
    packages = [ pkgs.home-manager ];
    shell = pkgs.zsh;
  };
}
