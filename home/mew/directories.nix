{ config, ... }: let 
  homeDirectory = "${config.home.homeDirectory}";
in {
  config = {
    home.file."1" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Pictures/memes";
      target = "${homeDirectory}/1";
    };
    home.file."1-0" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Pictures/memes";
      target = "${homeDirectory}/data/1";
    };
    home.file."memes" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Pictures/memes";
      target = "${homeDirectory}/data/Videos/memes";
    };
    home.file."Videos" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Videos";
      target = "${homeDirectory}/Videos";
    };
    home.file."Pictures" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Pictures";
      target = "${homeDirectory}/Pictures";
    };
    home.file."Games" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Games";
      target = "${homeDirectory}/Games";
    };
    home.file."games" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/data/Games";
      target = "${homeDirectory}/games";
    };
    home.file."Downloads" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/tmp";
      target = "${homeDirectory}/Downloads";
    };
    home.file."noita_gifs" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.local/share/Steam/steamapps/compatdata/881100/pfx/dosdevices/c:/users/steamuser/AppData/LocalLow/Nolla_Games_Noita/save_rec/screenshots_animated/";
      target = "${homeDirectory}/data/Videos/noita_gifs";
    };
    home.file."wallpapers" = {
      enable = false;
      source = config.lib.file.mkOutOfStoreSymlink "./applications/prism/wallpapers";
      target = "${homeDirectory}/data/Pictures/wallpapers";
    };
  };
}
