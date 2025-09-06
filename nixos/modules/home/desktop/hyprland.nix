{ config, pkgs, ... }:

    # ---------------------------
    # Spis treści konfiguracji
    # ---------------------------
    # 1. Monitors
    # 2. Programs
    # 3. AutoStart
    # 4. Look and Feel
    # 5. Input
    # 6. Keybinds
    # 7. Window Rules
    # 8. Environment Variables
    # 9. Trouble Shooting
    # 10. Programs/Apllications
    # ---------------------------

{
  wayland.windowManager.hyprland = {
    enable = true;
    sourceFirst = true;

    settings = {
        source = "~/.config/hypr/colors.conf";

        # Monitors
        monitor = [

            #  main monitor (Lenovo)
            "DP-2,2560x1440@165Hz, 0x0, 1"
            # side monitor (Iiyama)
            "DP-1, 1920x1080@75, -1080x-50, 1, transform, 1"
        ];

        workspace = [
            "1,monitor:DP-1"
            "2,monitor:DP-2"
            "3,monitor:DP-2"
            "4,monitor:DP-2"
            "5,monitor:DP-2"
            "6,monitor:DP-2"
            "7,monitor:DP-2"
            "8,monitor:DP-2"
            "9,monitor:DP-2"
            "10,monitor:DP-2"
        ];

        # Programs
        "$terminal" = "kitty";
        "$filemanager" = "nautilus";
        "$menu" = "rofi -show drun -show-icons";
        "$browser" = "flatpak run app.zen_browser.zen";
        "$wp" = "waypaper";
        "$hyprpanel" = "hyprpanel t settings-dialog";

        #AutoStart
        exec-once = [
            "hyprpanel"
            "hyprlock"
            "xrandr --output DP-2 primary"
            "swww-daemon"
            "exec-once=waypaper --restore"
        ];

        # Look and Feel
        general = {
            gaps_in = 5;
            gaps_out = 10;
            border_size = 3;
            "col.active_border" = "$primary";
            "col.inactive_border" = "$on_primary";
            resize_on_border = false;
            allow_tearing = true;
            layout = "dwindle";
        };

        decoration = {
            rounding = 0;
            rounding_power = 0;
            active_opacity = 1;
            inactive_opacity = 1;
            shadow = {
                enabled = true;
                range = 8;
                render_power = 3;
                color = "rgba(1a1a1aee)";
            };
            blur = {
                enabled = true;
                size = 3;
                passes = 1;
                vibrancy = 0.1696;
            };
        };

        animations= {
            enabled = true;
            
            bezier = [
                "myBezier, 0.05, 0.9, 0.1, 1.05"
                "been, 0.24, 0.9, 0.25, 0.91"
                "been2, 0,.94,.5,.99"
                "menu_decel, 0.1, 1, 0, 1"
                "linear, 0.0, 0.0, 1.0, 1.0"
                "wind, 0.05, 0.9, 0.1, 1.05"
                "winIn, 0.1, 1.1, 0.1, 1.1"
                "winOut, 0.3, -0.3, 0, 1"
                "slow, 0, 0.85, 0.3, 1"
                "overshot, 0.7, 0.6, 0.1, 1.1"
                "bounce, 1.1, 1.6, 0.1, 0.85"
                "sligshot, 1, -1, 0.15, 1.25"
                "nice, 0, 6.9, 0.5, -4.20"
            ];

            animation = [
                "windowsIn, 1, 5, slow, popin"
                "windowsOut, 1, 7, been, popin 70%"
                "windowsMove, 1, 5, wind, slide"
                "border, 1, 1, linear"
                "fade, 1, 5, overshot"
                "workspaces, 1, 5, wind"
                "windows, 1, 5, bounce, popin"
            ];
        };

        dwindle = {
            pseudotile = true; 
            preserve_split = true; 
        };       

        master = {
            new_status = "master";
        };

        misc  = {
            force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
            disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
        };

        # Input
        input = {
            kb_layout = "pl";
            kb_options = "";
            follow_mouse = 1;        #Zmiana aktywnego okna po najechaniu myszką. 
            force_no_accel = true;   #Akceleracja myszy. True = off
            sensitivity = 0;         #Czułość. "0" = Bez zmian.
            touchpad = {
                natural_scroll = true;
            };
        };

        gestures = {
            workspace_swipe = false;
        };

        device = {
            name = "epic-mouse-v1";
            sensitivity = -0.5;
        };

        # keybinds

        "$mainMod" = "SUPER";

        bind = [
            # Programs
            "$mainMod, Space, exec, $menu"
            "$mainMod, Return, exec, $terminal"
            "$mainMod, E, exec, $filemanager"
            "$mainMod, B, exec, $browser"
            "$mainMod, T, exec, $wp"
            "$mainMod, H, exec, $hyprpanel"
            
            # Actions
            "$mainMod, Q, killactive"
            "$mainMod, F, fullscreen"
            "$mainMod, L, exec, hyprlock"
            "$mainMod, V, togglefloating"
            "$mainMod, J, togglesplit"
            "$mainMod, PRINT, exec, grimblast --notify copysave area"
            ",PRINT, exec, grimblast --notify copysave output"
            "$mainMod, P, exec, wlogout"

            # Move focus with mainMod + arrow keys
            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            # Switch workspaces with mainMod + [0-9]
            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 10"

            ];

        bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "bindm = $mainMod, mouse:272, movewindow"
            "bindm = $mainMod, mouse:273, resizewindow"
        ];

        bindel = [ 
            ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
            ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];

        bindl = [ 
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
        ];

            # Window Rules

            windowrule = [
                "suppressevent maximize, class:.*"
                "stayfocused, class:Rofi"
                "stayfocused, class:^(waypaper)$"
            ];

            windowrulev2 = [
                # Rofi
                "float, class:Rofi"
                "center, class:Rofi"

                # Waypaper
                "float, class:^(waypaper)$"
                "center, class:^(waypaper)$"
                "size 800 600, class:^(waypaper)$"
                "noborder, class:^(waypaper)$"

                # Steam games
                "monitor:1, class:^steam_app_\\d+$"
                "workspace 10, class:^steam_app_\\d+$"
                "center, class:^steam_app_\\d+$"
                "fullscreen, class:^steam_app_\\d+$"
                "float, class:^steam_app_\\d+$"
                "noborder, class:^steam_app_\\d+$"
                "noanim, class:^steam_app_\\d+$"
            ];

            # Environment variables
            env = [
                "XCURSOR_THEME,Capitaine-Cursors"
                "XCURSOR_SIZE,24"
                "HYPRCURSOR_SIZE,24"
            
                "GDK_SCALE,1"
                "GTK_THEME,adw-gtk3-dark"
            
                # Prefer Wayland
                "GDK_BACKEND,wayland,x11,*"
                "QT_QPA_PLATFORM,wayland;xcb"
                "QT_STYLE_OVERRIDE,kvantum"
                "SDL_VIDEODRIVER,wayland"
                "MOZ_ENABLE_WAYLAND,1"
                "ELECTRON_OZONE_PLATFORM_HINT,wayland"
                "OZONE_PLATFORM,wayland"
            
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
            ];

            # Rozwiązuje problem z skalowaniem
            xwayland = {
                force_zero_scaling = true;
            };

            render = {
                # Rozszerza tekstury (naprawia artefakty graficzne)
                expand_undersized_textures = true;

                # Używać tylko na NVIDIA
                direct_scanout = true;
            };

            opengl = {
                nvidia_anti_flicker = true;
                # force_introspection = 2; # odkomentuj, jeśli potrzebujesz
            };

            debug = {
                overlay = false;
                damage_tracking = 0;
                disable_logs = false;
                enable_stdout_logs = true;
                disable_time = false;
                damage_blink = false;
            };
        };
  };

      home.packages = with pkgs; [
        wayland
        xwayland

        swww        # Wallpaper daemon
        waypaper    # Wallpaper Seter
        nautilus    # File Manager
        matugen     # Wallpaper Color Generation
        grimblast   # Screenshot utility
    ];


}