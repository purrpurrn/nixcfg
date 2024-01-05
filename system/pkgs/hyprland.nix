{ config, pkgs, inputs, ... }:
{
  config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.systemPackages = [
      pkgs.wl-clipboard
      inputs.hyprland-contrib.packages."x86_64-linux".grimblast 
      inputs.hyprpicker.packages."x86_64-linux".hyprpicker
    ];
  };
}
