{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "CascadiaCode" "DroidSansMono" ]; })

    # Microsoft fonts
    corefonts
    vistafonts
  ];

  fonts.fontDir.enable = true;

  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = with pkgs; [ terminus_font ];
  };
}
