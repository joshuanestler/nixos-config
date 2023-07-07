{ config, lib, pkgs, ... }: {

  # Enable V4L2 loopback device and kernel module
  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  environment.systemPackages = with pkgs; [
    obs-studio-plugins.droidcam-obs # for DroidCam OBS plugin
  ];
}
