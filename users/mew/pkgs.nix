{ config, pkgs, inputs, ... }:
{
 # imports = [
 #   ./pkgs/steam.nix
 # ];
  config = {
    users.users.mew.packages = [
      pkgs.prismlauncher
    ];
  };
}
