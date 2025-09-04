{ config, lib, pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
        
    };

    home.file.".config/rofi/config.rasi" = {
  source = ./config.rasi;
    };
}

