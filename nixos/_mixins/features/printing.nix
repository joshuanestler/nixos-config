{ rootPath, pkgs, ... }:
{
  services = {

    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.hplip
        (pkgs.writeTextDir "share/cups/model/oki-mc853.ppd" (builtins.readFile ../../../modules/printing/drivers/oki-mc853.ppd))
      ];
    };
  };
}
