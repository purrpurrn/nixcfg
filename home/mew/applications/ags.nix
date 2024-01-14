{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.ags.homeModule
  ];
  config = {
    programs.ags = {
      enable = true;
    };
  };
}
