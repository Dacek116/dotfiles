{ config, pkgs, lib, ... }:

{

    home.packages = with pkgs; [
        nwg-look            # Tool fo GTK theming
        discord             # Communicator
        spotify             # Music Streaming Service
        obs-studio          # Video Recording/Live Streaming App
        libreoffice-fresh   # Office Bundle
        mpv                 # Video Player
        loupe               # Image Browser
        evince              # PDF reader
        qbittorrent
        
    
    ];
}