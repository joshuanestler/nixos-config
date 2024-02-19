{ config, desktopEnvironments, lib, pkgs, rootPath, ... }: {
  # home.file."Dolphin configuration" = {
  #   enable = true;
  #   source = rootPath + "/config/desktop/plasma5/.config/dolphinrc";
  #   target = ".config/dolphinrc";
  # };

  # home.file."Lightly configuration" = {
  #   enable = true;
  #   source = rootPath + "/config/desktop/plasma5/.config/lightlyrc";
  #   target = ".config/lightlyrc";
  # };

  # home.file."Spectacle configuration" = {
  #   enable = true;
  #   source = rootPath + "/config/desktop/plasma5/.config/spectaclerc";
  #   target = ".config/spectaclerc";
  # };

  home.file."KDEdefaults" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/kdedefaults";
    target = ".config/kdedefaults";
    recursive = true;
  };

  # Lightly configuration
  programs.plasma = {
    configFile."lightlyrc" = {
      "Style"."DolphinSidebarOpacity" = 100;
    };
  };
}