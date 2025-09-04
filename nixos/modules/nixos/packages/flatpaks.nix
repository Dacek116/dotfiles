{ config, pkgs, ... }:

{
  services.flatpak.enable = true;

    environment.systemPackages = with pkgs; [
    flatpak
  ];

system.activationScripts = {
  flatpakFlathub = {
    text = ''
      FLATPAK="/run/current-system/sw/bin/flatpak"
      if ! $FLATPAK remote-list --system | grep -q flathub; then
        $FLATPAK remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
      fi
    '';
  };

  installFlatpaks = {
    text = ''
      FLATPAK="/run/current-system/sw/bin/flatpak"
      for app in \
        org.prismlauncher.PrismLauncher \
        app.zen_browser.zen; do
        if ! $FLATPAK list --system | grep -q "$app"; then
          $FLATPAK install -y --system flathub "$app"
        fi
      done
    '';
  };
};
}