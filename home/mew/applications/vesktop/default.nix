{ config, pkgs, ... }: {
  config = {
    home.packages = [
      pkgs.vesktop
    ];
  };
}
