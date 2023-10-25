{ config, desktopEnvironments, lib, pkgs, rootPath, ... }: {
  home.file."Dolphin configuration" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/dolphinrc";
    target = ".config/dolphinrc";
  };

  home.file."Lightly configuration" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/lightlyrc";
    target = ".config/lightlyrc";
  };

  home.file."Plasma theme" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/plasma-org.kde.plasma.desktop-appletsrc";
    target = ".config/plasma-org.kde.plasma.desktop-appletsrc";
  };

  home.file."Spectacle configuration" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/spectaclerc";
    target = ".config/spectaclerc";
  };

  home.file."KDEdefaults" = {
    enable = true;
    source = rootPath + "/config/desktop/plasma5/.config/kdedefaults";
    target = ".config/kdedefaults";
    recursive = true;
  };
}