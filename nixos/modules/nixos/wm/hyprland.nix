{ lib, config, pkgs, ... }:

{

# Enable Hyprland.
    programs.hyprland.enable = true; #Tiling Window manager
    programs.hyprlock.enable = true; #Screen locker for Hyprland
    
    xdg.portal = { # Enable xdg-desktop-portal for Hyprland
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

# Usefull Window Managers utilities
    environment.systemPackages = with pkgs; [
        hyprpanel   # A top panel for Hyprland
    
        matugen     # Dynamic color generator from wallpaper
        hyprsunset  # Automatic night mode for Hyprland
        waybar      # A highly customizable bar for Wayland
        #wlogout     # A logout menu for Wayland
        #swaynotificationcenter # Notification center for Wayland
    ];


}
