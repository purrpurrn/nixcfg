{ config, pkgs, ... }: {
  config = {
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      gnome.adwaita-icon-theme
    ];
  };
}
