{ config, lib, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        font.name = "FiraCode Nerd Font Mono";
        font.size = 14.5;
        extraConfig = ''
        include colors.conf
        background_opacity 0.6
    
        '';

    };
}