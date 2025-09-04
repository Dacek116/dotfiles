 { lib, config, pkgs, ... }:

 {


############################################
    
    environment.systemPackages = with pkgs; [   
    #Default Applications
        btop        # Default Task Manager
        nautilus    # Defa    #Terminal Utilities
        
        gtk3
        gtk4
        swww
        rofi
        matugen
    #Other

    
  ];    
}
