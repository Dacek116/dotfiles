{ config, pkgs, ... }:

{
    services.hyprsunset = {
        enable = true;
        package = pkgs.hyprsunset;
        transitions = {
            sunrise = {
                calendar = "*-*-* 06:00:00";
                requests = [
                [ "temperature" "6500" ]
                #[ "gamma 100" ]
                ];
            };
            sunset = {
                calendar = "*-*-* 19:00:00";
                requests = [
                [ "temperature" "3000" ]
                #[ "gamma 50" ]
                ];
            };
        };
    };
}