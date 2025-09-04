{ config, pkgs, lib, ... }:

let
  inherit (lib) mkIf optionals mkEnableOption;
in {
  options.minecraft.gaming = {
    enable = mkEnableOption "Enable Prism and java packages";

    prismlauncher.enable = mkEnableOption "Enable Prism Launcher";
    extraJavaPackages.enable = mkEnableOption "Enable extra Java packages";
  };

  config = let
    mc = config.minecraft.gaming;
  in {
    environment.systemPackages = with pkgs;
      optionals (mc.enable && mc.prismlauncher.enable) [
        (prismlauncher.override {
          additionalPrograms = with pkgs; [
            ffmpeg
            glfw
          ];
          jdks = optionals (mc.extraJavaPackages.enable) [
            jdk8
            jdk17
          ];
          gamemodeSupport = config.programs.gamemode.enable;
        })
      ];

    programs.java = mkIf mc.enable {
      enable = true;
      package = pkgs.jdk;
      binfmt = true;
    };
  };
}
