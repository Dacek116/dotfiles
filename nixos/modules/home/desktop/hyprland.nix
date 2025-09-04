{ lib, config, pkgs, ... }:

{

# Enable Hyprland.
    programs.hyprland.enable = true; #Tiling Window manager
    programs.hyprlock.enable = true; #Screen locker for Hyprland
    

# Usefull Window Managers utilities
    environment.systemPackages = with pkgs; [
        hyprpanel   # A top panel for Hyprland
    
        
        waybar      # A highly customizable bar for Wayland
        #wlogout     # A logout menu for Wayland
        #swaynotificationcenter # Notification center for Wayland
    ];


}
