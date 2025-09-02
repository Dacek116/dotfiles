{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. 
      #/etc/nixos/hardware-configuration.nix  # Uncomment to use the default hardware configuration (recommended)
    
    # Desktop environment
      ./desktop/hyprland.nix
      #./desktop/gnome.nix
      #./desktop/plasma.nix

    # Packages
      ./packages/pkgs.nix
      ./packages/flatpaks.nix
      ./packages/fonts.nix

    # Gaming
      ./gaming/default.nix

    # System
      ./system/default.nix
      ./system/hardware.nix
      ./system/nvidia.nix
      ./system/services.nix
    ];


#Enable git
  programs.git = {
    enable = true;
    config = {
      user.name = "Dacek116";
      user.email = "dapeloom046@gmail.com";
      init.defaultBranch = "main";
    };
  };

#Install firefox.
  programs.firefox.enable = true;

} 
