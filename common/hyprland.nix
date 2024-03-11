{ config, pkgs, inputs, ... }: {
  config = {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages."x86_64-linux".hyprland;
      xwayland.enable = true;
    };
  };
}
