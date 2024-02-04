{ config, pkgs, inputs, ... }: {
  config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
