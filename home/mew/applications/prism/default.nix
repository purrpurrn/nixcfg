{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.prism.homeModules.prism
  ];
  config = {
    prism = {
      enable = true;
      wallpapers = ./wallpapers;
      outPath = "data/Pictures/generated_wallpapers";
      colorscheme = "rose-pine";
    };
  };
}
