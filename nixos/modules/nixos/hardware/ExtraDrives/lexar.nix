{ config, pkgs, ... }:

{   
    
    system.activationScripts.createMountPoint.text = ''
        mkdir -p /mnt/Lexar
        chown -R dacek:users /mnt
        chown -R dacek:users /mnt/Lexar
    '';

    fileSystems."/mnt/Lexar" = {
        device = "/dev/disk/by-uuid/70070a0b-78fb-4bc8-a314-1db30826c9ff";  # tutaj UUID dysku
        fsType = "ext4";  # albo inny typ systemu plików
        options = [ "nofail" "nosuid" "nodev" "exec" ];
    };
}
