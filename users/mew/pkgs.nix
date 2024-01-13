{ config, pkgs, inputs, ... }:
{
 # imports = [
 #   ./pkgs/steam.nix
 # ];
  config = {
    users.users.mew.packages = [
      pkgs.google-chrome
      pkgs.btop
      pkgs.neofetch
      pkgs.prismlauncher
      pkgs.swaybg
      pkgs.hyprpaper
      pkgs.vesktop
      pkgs.kitty
      pkgs.killall
      pkgs.git
    ];
  };
}
