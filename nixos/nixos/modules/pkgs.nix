{ lib, config, pkgs, ... }:


{

      # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

#################################################################################################
###########         Programy            #########################################################
#################################################################################################

    programs.git = {
    enable = true;
    config = {
      user.name = "Dacek116";
      user.email = "dapeloom046@gmail.com";
      init.defaultBranch = "main";
    };
  };

  programs.steam = {
    enable = true;
    dedicatedServer.openFirewall = true;
  };


  programs.gamemode.enable = true;

  programs.steam.package = pkgs.steam.override {
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


  # Install firefox.
  programs.firefox.enable = true;

  programs.hyprlock.enable = true;

  programs.fish.enable = true;

#################################################################################################
###########         Packages        #############################################################
#################################################################################################

  users.users.dacek = {
    packages = with pkgs; [
      discord
      spotify
      heroic
      lutris
      protonup-qt
      goverlay
      mangohud
      vscode
    ];
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    cava
    btop
    kitty
    hyprpanel
    rofi
    fastfetch
    tree
    swww
    matugen
    hyprsunset
    yazi
    nautilus
    nwg-look
    adw-gtk3
    gnome-themes-extra
    papirus-icon-theme
    cmatrix    
    pipewire
    gdb
    unzip
    gparted
  ];

  fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
  ];

}
