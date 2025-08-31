{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix

      ./apps/pkgs.nix
      ./apps/flatpaks.nix
      ./gaming/default.nix
      ./system/audio.nix
      ./system/nvidia.nix
      ./system/auto.nix
      ./system/desktop.nix
      ./system/fonts.nix
      ./system/services.nix
      ./system/default.nix
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
