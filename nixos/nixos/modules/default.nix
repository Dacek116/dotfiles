
{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      #./modules/default.nix
      ./modules/desktop.nix
      ./modules/pkgs.nix
      ./modules/NVIDIA.nix
      ./modules/services.nix
    ];

# Bootloader.

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

# Enable flakes

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Kernel

    boot.kernelPackages = pkgs.linuxPackages_6_15;


# TimeZone
    time.timeZone = "Europe/Warsaw";


# User

    users.users.dacek = {
        isNormalUser = true;
        description = "Dawid Czachor";
        extraGroups = [ "networkmanager" "wheel" ];
    };

# Networking

    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };



# Garbage Collector

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 15d";
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?


}
