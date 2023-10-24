{ config, pkgs, desktopEnvironments, ... }:
let
  flatpak = import ./flatpak.nix { inherit pkgs; };
in
{
  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.gamescope = {
    enable = true;
  };

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;


  environment.systemPackages = with pkgs.unstable; [
    protontricks
    vkBasalt
    protonup-qt
    mangohud

    heroic # Epic Games Store

    # Minecraft
    temurin-jre-bin-8 # - 1.16.5
    temurin-jre-bin-17 # 1.17 +
  ];

  systemd.services.install-gaming = {
    description = "Install Gaming flatpaks";
    wantedBy = [ "multi-user.target" ];
    wants = [ "network-online.target" "flatpak-install-base.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = ''
        ${flatpak.flatpakInstallCommandDefault} \
        org.prismlauncher.PrismLauncher \
      '';

      # TODO: Add more flatpaks
      # 
      # com.valvesoftware.Steam \
      # com.valvesoftware.Steam.CompatibilityTool.Boxtron \
      # com.valvesoftware.Steam.Utility.protontricks \
      # com.valvesoftware.Steam.Utility.gamescope \
      # org.freedesktop.Platform.VulkanLayer.MangoHud \
      # org.freedesktop.Platform.VulkanLayer.vkBasalt \
      # com.heroicgameslauncher.hgl \
    };
  };
}
