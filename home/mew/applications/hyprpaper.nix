{ config, pkgs, ... }: {
  config = {
    home.packages = [ pkgs.hyprpaper ];
    xdg.configFile."hyprpaper.conf" = {
      enable = true;
      target = "/home/mew/.config/hypr/hyprpaper.conf";
      text = ''
        preload = ~/data/Pictures/wallpapers/1.png

        wallpaper = ,~/data/Pictures/wallpapers/1.png

        splash = false
      '';
    };
  };
}
