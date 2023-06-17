{ config, pkgs, ... }:

{
  # NVIDIA drivers are unfree.
  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;


  # nvidia-drm.modeset=1 is required for some wayland compositors, e.g. sway
  hardware.nvidia.modesetting.enable = true;
  # hardware.nvidia.powerManagement.enable = true;

  # hardware.nvidia.prime = {
  #   offload.enable = true;
  #   intelBusId = "PCI:0:2:0";
  #   nvidiaBusId = "PCI:1:0:0";
  # };

  # Disable the integrated GPU

  # intel
  # boot.kernelParams = [ "module_blacklist=i915" ];
  # AMD
  # boot.kernelParams = [ "module_blacklist=amdgpu" ];
}
