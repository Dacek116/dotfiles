{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dacek";
  home.homeDirectory = "/home/dacek";
  home.stateVersion = "25.05"; # Please read the comment before changing.


    imports = [
    ./xdg.nix
    ./programs/terminal/default.nix
    ./programs/dev/git.nix
    ./programs/dev/vscode.nix
    ./programs/user/apps.nix
    ./desktop/hyprland.nix

    ./desktop/hyprpanel.nix
    ./desktop/rofi.nix
    ./desktop/hyprlock.nix
    ./desktop/wlogout.nix
    ./desktop/hyprsunset.nix
    
    ];

    
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
  
  ];



        home.file.".config/matugen" = {
        source = ./.files/matugen;
        recursive = true;
    };

        home.file.".config/btop" = {
        source = ./.files/btop;
        recursive = true;
    };

    home.file.".config/fastfetch" = {
        source = ./.files/fastfetch;
        recursive = true;
    };

        home.file.".config/gtk-3.0" = {
        source = ./.files/gtk-3.0;
        recursive = true;
    };

        home.file.".config/gtk-4.0" = {
        source = ./.files/gtk-4.0;
        recursive = true;
    };

        home.file.".config/waypaper" = {
        source = ./.files/waypaper;
        recursive = true;
    };


   ##     home.file.".config/hyprpanel" = {
    #    source = ./.files/hyprpanel;
    #    recursive = true;
    #};


  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dacek/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
