{ config, pkgs, inputs, ... }: {
  config = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      plugins = [
        inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      ];
    };
  };
}
