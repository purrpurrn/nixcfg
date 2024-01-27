{ config, pkgs, lib, ... }: {
  config = {
    home.file."1" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures/memes";
      target = "/home/mew/1";
    };
    home.file."memes" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/data/Pictures/memes";
      target = "/home/mew/data/Videos/memes";
    };
    home.file."Downloads" = {
      enable = true;
      source = config.lib.file.mkOutOfStoreSymlink "/home/mew/Downloads";
  #    target = "/home/mew/Downloads";
    };
  };
}
