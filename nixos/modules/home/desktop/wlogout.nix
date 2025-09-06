{ config, pkgs, ... }:

{
      
      programs.wlogout = {
        enable = true;
        layout = [

          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
            keybind = "s";
          }
          {
            label = "reboot";
            action = "systemctl reboot";
            text = "Reboot";
            keybind = "r";
          }
          {
            label = "lock";
            action = "hyprlock";
            text = "Lockscreen";
            keybind = "l";
          }
        ];
        style = ''

            @import "colors.css";

          window {
            font-family: monospace;
            font-size: 14pt;
            color: #cdd6f4; /* text */
            background-color: rgba(30, 30, 46, 0.5);
          }

          button {
            background-repeat: no-repeat;
            background-position: center;
            background-size: 25%;
            border: none;
            background-color: @surface;
            margin: 50px;
            transition: box-shadow 0.2s ease-in-out, background-color 0.2s ease-in-out;
          }


          button:focus {
            background-color: @primary;
            color: #1e1e2e;
          }
          #lock {
            background-image: image(url("icons/lock.png"));
          }
          #lock:focus {
            background-image: image(url("icons/lock-hover.png"));
          }

          #logout {
            background-image: image(url("icons/logout.png"));
          }
          #logout:focus {
            background-image: image(url("icons/logout-hover.png"));
          }

          #suspend {
            background-image: image(url("icons/sleep.png"));
          }
          #suspend:focus {
            background-image: image(url("icons/sleep-hover.png"));
          }

          #shutdown {
            background-image: image(url("icons/power.png"));
          }
          #shutdown:focus {
            background-image: image(url("icons/power-hover.png"));
          }

          #reboot {
            background-image: image(url("icons/restart.png"));
          }
          #reboot:focus {
            background-image: image(url("icons/restart-hover.png"));
          }
        '';
        };

          home.file.".config/wlogout/icons" = {
          source = ../.files/wlogout/icons;
          recursive = true;
        };
}
