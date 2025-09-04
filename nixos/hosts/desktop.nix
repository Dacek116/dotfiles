{ lib, config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan. 
      /etc/nixos/hardware-configuration.nix  # Uncomment to use the default hardware configuration (recommended)

    # Modules
        # NixOS
        ../modules/nixos/bootloader/systemd.nix

        ../modules/nixos/wm/hyprland.nix

        ../modules/nixos/gaming/default.nix

        ../modules/nixos/hardware/ExtraDrives/lexar.nix
        ../modules/nixos/hardware/GPU/nvidia.nix

        ../modules/nixos/packages/flatpaks.nix
        ../modules/nixos/packages/fonts.nix
        ../modules/nixos/packages/pkgs.nix

        ../modules/nixos/shells/fish.nix

        ../modules/nixos/system/audio.nix
        ../modules/nixos/system/locale.nix
        ../modules/nixos/system/network.nix
        ../modules/nixos/system/services.nix
        ../modules/nixos/system/timezone.nix
        ../modules/nixos/system/kernel.nix

        ../modules/nixos/users/dacek.nix
    ];


        nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
        };



    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];



#Install firefox.
  programs.firefox.enable = true;

  system.stateVersion = "25.05";  

  
} 
