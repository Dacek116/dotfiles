{ config, pkgs, lib, ... }:

{
  # Enable GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "papirus";
    };
    cursorTheme = {
      package = pkgs.capitaine-cursors;
      name = "Capitaine Cursors";
      size = 24;
    };
    
  };

  # Enable QT
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    #style = {
    #  name = "kvantum";
    #};
  };
}