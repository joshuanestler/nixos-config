{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    vscode
    texlive.combined.scheme-full
    libreoffice
    nixpkgs-fmt # Allow to format nix files with nixpkgs-fmt
    zip
    unzip
  ];

  programs = {
    git.enable = true;
    java.enable = true;

    # zsh = {
    #   enable = true;
    #   enableCompletion = true;

    #   histSize = 10000;

    #   syntaxHighlighting.enable = true;
    #   autosuggestions.enable = true;
    # };
  };
}
