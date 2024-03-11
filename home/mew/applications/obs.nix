{ config, pkgs, ... }: {
  config = {
    programs.obs-studio = {
      enable = true;
      plugins = [
        pkgs.obs-studio-plugins.obs-vaapi
        pkgs.obs-studio-plugins.obs-gstreamer
      ];
    };
  };
}
