{ lib, config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. 
      /etc/nixos/hardware-configuration.nix  # Uncomment to use the default hardware configuration (recommended)

      ../modules/nixos/default.nix
      ../modules/home/desktop/hyprland.nix
    ];

      nvidia.enable = true;
      mount.lexar.enable = true;
      gaming.enable = true;


      

  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Garbage collector 
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
    };

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.05";  
  
} 
