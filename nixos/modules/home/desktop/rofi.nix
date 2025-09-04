{ config, lib, ... }:

{
    programs.rofi = {
        enable = true;


};
    home.file = {
    ".config/rofi/config.rasi".source = ../.files/rofi/config.rasi;
    };

}