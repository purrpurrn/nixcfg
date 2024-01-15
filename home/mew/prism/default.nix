{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.prism.homeModules.prism
  ];
  config = {
    prism = {
      enable = true;
      wallpapers = ./wallpapers;
      outPath = "/home/mew/data/Pictures/wallpapers";
      colorscheme = "rose-pine";
    };
  };
}
