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
        rofi        # Application launcher and more
        swww        # Wallpaper setter for Wayland
        matugen     # Dynamic color generator from wallpaper
        hyprsunset  # Automatic night mode for Hyprland
        waybar      # A highly customizable bar for Wayland
        #wlogout     # A logout menu for Wayland
        #swaynotificationcenter # Notification center for Wayland
    ];

    # Wyłącz LightDM
    services.xserver.displayManager.enable = false;

    # Autologowanie do tty1
    services.getty.autoLogin.enable = true;
    services.getty.autoLogin.user = "dacek";

}
