{ config, pkgs, ... }: {
  config = {
    programs.chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      ];
      dictionaries = [ pkgs.hunspellDictsChromium.en_US ];
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "pncfbmialoiaghdehhbnbhkkgmjanfhe" # uBlacklist
        "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislikes
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
        "bhchdcejhohfmigjafbampogmaanbfkg" # User-Agent Switcher and Manager
      ];
    };

    security.bubblewrap.programs.chromium = {
      home = true;
      dbus = true;
      gui = true;
      audio = true;
      webcam = false;
      network = true;
      command = "${pkgs.chromium}/bin/chromium";
      args = ["--enable-features=UseOzonePlatform --ozone-platform=wayland"];
      readWriteDirs = [
        "$HOME/Downloads"
        "$HOME/.config/chromium"
      ];
    };
  };
}
