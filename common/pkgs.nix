{ config, pkgs, ... }: {
  config = {
    environment.systemPackages = [
      pkgs.jq
      pkgs.btop
      pkgs.htop
      pkgs.killall
    ];
  };
}
