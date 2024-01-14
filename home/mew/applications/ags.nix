{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.ags.homeManagerModules.default
  ];
  config = {
    programs.ags = {
      enable = true;
    };
  };
}
