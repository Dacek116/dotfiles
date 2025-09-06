{ lib, config, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        package = pkgs.kitty;
        font.name = "FiraCode Nerd Font";
        font.size = 14;
        extraConfig = ''
            background_opacity 0.6
            include colors.conf
        '';
    };

    programs.fish = {
        enable = true;
        shellInit = ''
            if status is-interactive
            ff
            end

    set -g fish_greeting ""
  '';
};

    home.packages = with pkgs; [ 
        cava
        cmatrix
        killall
        yazi
        tree
        btop
        bat
        fastfetch
        ];
}

