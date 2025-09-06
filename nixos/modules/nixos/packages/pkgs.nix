{ config, pkgs, lib, ... }:

{
    environment.systemPackages = with pkgs; [
        # Programy Systemowe
        simple-scan
        gnome-calculator 
        polkit_gnome

        # Graphic Utilities
        libva
        libva-utils
        vulkan-tools
        vulkan-headers

        # Libs
        mesa
        gtk3
        gtk4

        # Themes and Icons

        papirus-icon-theme
        papirus-folders
        adw-gtk3
        capitaine-cursors
    ];
}
    
