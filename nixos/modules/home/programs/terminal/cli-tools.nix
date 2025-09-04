{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tree
    bat
    yazi # Terminal file manager
    btop # Advanced process manager
    killall
    # Other tools
    wget
    zip
    unzip
    ffmpeg
    wl-clipboard

  ];
}