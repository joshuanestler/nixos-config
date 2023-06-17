{ config, pkgs, ... }:

{
  networking = {
    hostName = "harmony"; # Define your hostname

    networkmanager.enable = true; # Enable networking

    firewall = {
      enable = true; # Enable firewall
      # allowedTCPPorts = [ 22 80 443 ]; # Open ports
    };

    wireless.enable = false; # Disable wireless
  };
}
