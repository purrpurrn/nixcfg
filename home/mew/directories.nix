{ config, pkgs, lib, ... }: {
  config = {
    home.file."1" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures/memes";
      target = "/home/mew/1";
    };
    home.file."1-0" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures/memes";
      target = "/home/mew/data/1";
    };
    home.file."memes" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures/memes";
      target = "/home/mew/data/Videos/memes";
    };
    home.file."Videos" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Videos";
      target = "/home/mew/videos";
    };
    home.file."Pictures" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures";
      target = "/home/mew/pictures";
    };
    home.file."Games" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Games";
      target = "/home/mew/games";
    };
    home.file."Downloads" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/tmp/downloads";
      target = "/home/mew/Downloads";
    };
    home.file."noita_gifs" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/.local/share/Steam/steamapps/compatdata/881100/pfx/dosdevices/c:/users/steamuser/AppData/LocalLow/Nolla_Games_Noita/save_rec/screenshots_animated/";
      target = "/home/mew/data/Videos/noita_gifs";
    };
  };
}
