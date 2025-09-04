{pkgs, ... }:

{
  home.packages = [
    pkgs.tree
    pkgs.fastfetch
    pkgs.btop
    pkgs.bat    
    ];

}