{ config, pkgs, ... }: {
  config = {
    home.packages = [ pkgs.streamlink ];
    xdg.configFile."streamlink/config".text = ''
      player=mpv
    '';
  };
}
