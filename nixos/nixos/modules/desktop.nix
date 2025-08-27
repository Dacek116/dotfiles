

{ lib, config, pkgs, ... }:

{


# Enable the GNOME Desktop Environment.
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;


# Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    #services.desktopManager.plasma6.enable = false;

# Enable Hyprland.
    programs.hyprland.enable = true;


}
