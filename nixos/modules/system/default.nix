{ lib, config, pkgs, ... }:
{
    # User
    users.users.dacek = {
        isNormalUser = true;
        description = "Dawid Czachor";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    #Use Fish as default Shell
    programs.fish.enable = true;
    users.defaultUserShell = pkgs.fish;
    

    # Enable flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Kernel
    boot.kernelPackages = pkgs.linuxPackages_6_15;

    # TimeZone
    time.timeZone = "Europe/Warsaw";

    # Networking
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };

    # Wybierz właściwości internacjonalizacji.
    i18n.defaultLocale = "pl_PL.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "pl_PL.UTF-8";
        LC_IDENTIFICATION = "pl_PL.UTF-8";
        LC_MEASUREMENT = "pl_PL.UTF-8";
        LC_MONETARY = "pl_PL.UTF-8";
        LC_NAME = "pl_PL.UTF-8";
        LC_NUMERIC = "pl_PL.UTF-8";
        LC_PAPER = "pl_PL.UTF-8";
        LC_TELEPHONE = "pl_PL.UTF-8";
        LC_TIME = "pl_PL.UTF-8";
    };

    # Configure console keymap
    console.keyMap = "pl2";

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "pl";
        variant = "";
    };

      system.stateVersion = "25.05";
}