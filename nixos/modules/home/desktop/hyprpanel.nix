{ lib, config, pkgs, ... }:

{
    programs.hyprpanel = {
        enable = true;
        package = pkgs.hyprpanel;
        settings = {
            "theme.font.size" = "1.0rem";
            "theme.font.name" = "FiraCode Nerd Font Mono";
            "theme.font.label" = "FiraCode Nerd Font Mono Bold";
            "theme.font.weight" = 900;
            "bar.layouts" = {
                "0" = {};
                "1" = {
                  "left"= [
                    "workspaces"
                    "windowtitle"
                  ];
                  "middle" = [
                    "media"
                  ];
                  "right" = [
                    "systray"
                    #"hyprsunset"
                    "volume"
                    "clock"
                    "notifications"
                    ];
                };
            };
            "bar.workspaces.workspaceMask" = false;
            "bar.workspaces.show_numbered" = true;
            "bar.workspaces.monitorSpecific"= false;
            "bar.workspaces.workspaces" = 10;
            "wallpaper.enable" = false;
            "theme.notification.opacity" = 95;
            "theme.osd.opacity" = 95;
            "menus.clock.weather.enabled" = false;
            "menus.volume.raiseMaximumVolume" = false;
            "theme.osd.orientation" = "horizontal";
            "theme.osd.location" = "top";
            "theme.osd.monitor" = 1;
            "theme.osd.margins" = "999px 0px 0px 0px";
            "menus.clock.time.military" = true;
            "theme.bar.buttons.windowtitle.spacing" = "1.0em";
            "bar.clock.format" = "%H:%M:%S | %d.%m.%Y";
            "theme.bar.buttons.media.spacing" = "0.8em";
            "bar.media.show_active_only" = true;
            "bar.media.truncation_size" = 60;
            "wallpaper.image" = "/home/dacek/.config/nixos/modules/home/desktop/hyprland.jpg";
            "theme.matugen" = true;
            "theme.matugen_settings.scheme_type" = "fidelity";
            "theme.matugen_settings.variation" = "monochrome_1";
            "theme.bar.buttons.background_hover_opacity" = 90;
            "theme.bar.buttons.background_opacity" = 80;
            "theme.bar.menus.opacity" = 95;
            "theme.bar.margin_sides" = "0.2em";
            "theme.bar.buttons.spacing" = "0.30em";
            "theme.bar.outer_spacing" = "0.3em";
            "theme.bar.buttons.y_margins" = "0.4em";
            "theme.bar.buttons.radius" = "0.3em";
            "theme.bar.buttons.padding_y" = "0.0rem";
            "notifications.active_monitor" = false;
            "notifications.monitor" = 1;
            "theme.bar.menus.menu.notifications.height" = "94em";
            "notifications.position" = "top right";
            "theme.font.style" = "normal";
            "bar.notifications.hideCountWhenZero" = false;
            "tear" = true;
            "menus.transition" = "crossfade";
            "menus.transitionTime" = 150;
            "theme.bar.floating"= false;
            "theme.bar.margin_top" = "0.2em";
            "theme.bar.margin_bottom"= "0em";
            "theme.bar.transparent" = false;
            "bar.customModules.hyprsunset.temperature" = "3000k";
        };
    };

}