if status is-interactive
    ff
end

set -g fish_greeting ""

if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    exec Hyprland
end
