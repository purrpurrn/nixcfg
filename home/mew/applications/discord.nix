{ config, pkgs, ... }: {
  config = {
    xdg.desktopEntries.discord = {
      name = "${pkgs.discord.pname}";
      exec = "${pkgs.chromium}/bin/chromium --hide-scrollbars --app=https://discord.com/app";
      genericName = "${pkgs.discord.meta.description}";
      categories = [ "Network" "InstantMessaging" ];
      mimeType = [ "x-scheme-handler/discord" ];
    };
  };
}
