
{ lib, config, pkgs, ... }:

{
########################################
#######         Nvidia          ########
########################################

hardware.graphics = {
  enable = true;
  enable32Bit = true;
};

# Enable proprietary NVIDIA driver with modesetting
hardware.nvidia = {
modesetting.enable = true; # Wymagane dla Wayland
nvidiaSettings = true;
open = false;  # Use proprietary driver, not nouveau
package = config.boot.kernelPackages.nvidiaPackages.latest;
};

# Enable X server with NVIDIA driver
services.xserver = {
enable = true;
videoDrivers = [ "nvidia" ];
};

# Environment variables for Wayland or X11 sessions
environment.sessionVariables = {
GBM_BACKEND = "nvidia-drm";
LIBVA_DRIVER_NAME = "nvidia";
__GLX_VENDOR_LIBRARY_NAME = "nvidia";
XDG_SESSION_TYPE = "wayland"; # Change to "x11" if you use X11
};

# Accept NVIDIA license
nixpkgs.config.nvidia.acceptLicense = true;

###############################
### GAMING ###################
#############################

environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "\${HOME}/.steam/root/compatibilitytools.d";

};


}
