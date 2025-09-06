{ config, pkgs, ... }: 

let
  home = config.home.homeDirectory;
in {
    
  #= XDG
  xdg = {
    enable = true;
    # autostart.enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      #= Directories
      download = "${home}/Pobrane";
      desktop = "${home}/Pulpit";
      documents = "${home}/Dokumenty";
      music = "${home}/Muzyka";
      pictures = "${home}/Obrazy";
      videos = "${home}/Wideo";
      templates = "${home}/Szablony";
      publicShare = "${home}/Publiczne";
      #extraConfig = {
      #  XDG_BACKUP_DIR = "${home}/Backup";
      #  XDG_SCREENSHOTS_DIR = "${home}/Obrazy/Zrzuty ekranu";
      #};
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "gtk";
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "nautilus.desktop";
        "x-scheme-handler/http" = "app.zen_browser.zen.desktop";
        "x-scheme-handler/https" = "app.zen_browser.zen.desktop";
        "application/x-extension-htm" = "app.zen_browser.zen.desktop";
        "application/x-extension-html" = "app.zen_browser.zen.desktop";
        "application/x-extension-shtml" = "app.zen_browser.zen.desktop";
        "application/xhtml+xml" = "app.zen_browser.zen.desktop";
        "application/x-extension-xhtml" = "app.zen_browser.zen.desktop";
        "application/x-extension-xht" = "app.zen_browser.zen.desktop";
        "application/pdf" = "libreofficewriter.desktop";
        "text/markdown" = "hx.desktop";
        "text/plain" = "hx.desktop";
        "text/x-shellscript" = "hx.desktop";
        "text/x-python" = "hx.desktop";
        "text/x-go" = "hx.desktop";
        "text/css" = "hx.desktop";
        "text/javascript" = "hx.desktop";
        "text/x-c" = "hx.desktop";
        "text/x-c++" = "hx.desktop";
        "text/x-java" = "hx.desktop";
        "text/x-rust" = "hx.desktop";
        "text/x-yaml" = "hx.desktop";
        "text/x-toml" = "hx.desktop";
        "text/x-dockerfile" = "hx.desktop";
        "text/x-xml" = "hx.desktop";
        "text/x-php" = "hx.desktop";
        "image/png" = "loupe.desktop";
        "image/jpg" = "loupe.desktop";
        "image/jpeg" = "loupe.desktop";
        "image/gif" = "loupe.desktop";
        "image/svg" = "loupe.desktop";
        "image/tiff" = "loupe.desktop";
        "video/avi" = "mpv.desktop";
        "video/mp4" = "mpv.desktop";
        "video/mkv" = "mpv.desktop";
      };
    };
  };
}