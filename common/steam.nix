{ config, pkgs, ... }: {
  config = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };

    programs.steam.package = pkgs.steam.override {
      extraLibraries = (pkgs: [
          pkgs.xorg.libXcursor
          pkgs.xorg.libXi
          pkgs.xorg.libXinerama
          pkgs.xorg.libXScrnSaver
          pkgs.libpng
          pkgs.libpulseaudio
          pkgs.libvorbis
          pkgs.stdenv.cc.cc.lib
          pkgs.libkrb5
          pkgs.keyutils
      ]);
    };

    environment.systemPackages = [
      pkgs.steam-run
      pkgs.mangohud
    ];

    programs.gamescope = {
      enable = true;
      capSysNice = true;
      args = [
        "--rt"
        "--output-width 1920"
        "--output-height 1080"
        "--nested-width 1920"
        "--nested-height 1080"
        "--expose-wayland"
        "--framerate-limit 165"
        "--borderless"
      ];
    };
  
    programs.gamemode.enable = true;
 };
}
