{ config, pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
  };

  environment.systemPackages = [
    pkgs.steam-run
    pkgs.mangohud
  ];

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };
}
