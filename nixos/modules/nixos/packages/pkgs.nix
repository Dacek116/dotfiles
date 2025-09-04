 { lib, config, pkgs, ... }:

 {

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

############################################
    
    environment.systemPackages = with pkgs; [   
    #Default Applications
        btop        # Default Task Manager
        nautilus    # Default File Manager
     
    #Terminal Utilities
        
        fastfetch   # System Information Tool
        yazi        # Terminal File Manager
        cava        # Audio Visualizer
        cmatrix     # Matrix-style terminal effect
        tree        # Directory Tree Viewer
        unzip       # File Extraction Tool

    #GTK, Themes and Icons
        gtk3
        gtk4
        papirus-icon-theme
        adw-gtk3
        gnome-themes-extra
        capitaine-cursors

    #Other

    
  ];    
}
