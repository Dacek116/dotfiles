{ lib, config, pkgs, ... }:

{
#Enable steam
    programs.steam = {
        enable = true;
        dedicatedServer.openFirewall = true;
        package = pkgs.steam.override {
            extraPkgs = pkgs': with pkgs'; [
                xorg.libXcursor
                xorg.libXi
                xorg.libXinerama
                xorg.libXScrnSaver
                libpng
                libpulseaudio
                libvorbis
                stdenv.cc.cc.lib # Provides libstdc++.so.6
                libkrb5
                keyutils
                # Add other libraries as needed
            ];
        };
    };

#Enable gamemode
    programs.gamemode.enable = true;

#Gaming Utilities
    environment.systemPackages = with pkgs; [
        heroic
        lutris
        protonup-qt
        goverlay
        mangohud
    ];

}