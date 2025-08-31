

{ lib, config, pkgs, ... }:

{


# Enable the GNOME Desktop Environment.
    #services.xserver.displayManager.gdm.enable = true;
    #services.xserver.desktopManager.gnome.enable = true;


# Enable the KDE Plasma Desktop Environment.
    #services.displayManager.sddm.enable = true;
    #services.desktopManager.plasma6.enable = false;

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
        rofi        # Application launcher and more
        swww        # Wallpaper setter for Wayland
        matugen     # Dynamic color generator from wallpaper
        hyprsunset  # Automatic night mode for Hyprland
        waybar      # A highly customizable bar for Wayland
        #wlogout     # A logout menu for Wayland
        #swaynotificationcenter # Notification center for Wayland
    ];

}