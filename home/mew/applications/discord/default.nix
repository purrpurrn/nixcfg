{ config, pkgs, ... }: let
  discordWebDir = ".config/discordWebConfig";
  homeDir = "/home/mew";
in {
  config = {
    xdg.desktopEntries.discord = {
      name = "${pkgs.discord.pname}";
      exec = "${pkgs.chromium}/bin/chromium --user-data-dir=${homeDir}/${discordWebDir} --enable-features=UseOzonePlatform,WebUIDarkMode --ozone-platform=wayland --force-dark-mode --hide-scrollbars --app=https://discord.com/app";
      icon = ./discord.svg;
      genericName = "${pkgs.discord.meta.description}";
      categories = [ "Network" "InstantMessaging" ];
      mimeType = [ "x-scheme-handler/discord" ];
    };
  };
}
