{ config, pkgs, ... }: let
  aagl-gtk-on-nix = import (builtins.fetchTarball { 
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "17b6jwyxfvjrdqr82zs56j70xy02qzvma4xv7xk5k8xkjwb0rb8j";
  });
in {
  config = {
    home.packages = [
      aagl-gtk-on-nix.anime-game-launcher
      aagl-gtk-on-nix.anime-borb-launcher
      aagl-gtk-on-nix.honkers-railway-launcher
      aagl-gtk-on-nix.honkers-launcher
    ];
  };
}
