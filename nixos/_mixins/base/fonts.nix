{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" "DroidSansMono" ]; })
  ];

  fonts.fontDir.enable = true;

  console.font = "CascadiaCode";
}
