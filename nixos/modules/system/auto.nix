
{ lib, config, pkgs, ... }:

{
# Garbage Collector

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };
}
