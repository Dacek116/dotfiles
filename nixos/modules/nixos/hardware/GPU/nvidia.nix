{ config, lib, pkgs, ... }:

let
  cfg = config.nvidia;
in {
  options.nvidia.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable NVIDIA drivers and configuration";
  };

  config = lib.mkIf cfg.enable {

    nixpkgs.config.nvidia.acceptLicense = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
      modesetting.enable = true;
      nvidiaSettings = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    services.xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
    };

    environment.sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland"; # Zmień na "x11" jeśli nie używasz Waylanda
    };
  };
}
