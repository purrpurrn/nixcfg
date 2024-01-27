{ config, pkgs, ... }: {
  config = {
    programs.chromium = {
      enable = true;
      homepageLocation = "about:blank";
      commandLineArgs = [
        "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      ];
      dictionaries = [ 
        pkgs.hunspellDictsChromium.en_US 
        pkgs.hunspellDictsChromium.de_DE
      ];
      extensions = [
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "pncfbmialoiaghdehhbnbhkkgmjanfhe" # uBlacklist
        "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislikes
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
        "bhchdcejhohfmigjafbampogmaanbfkg" # User-Agent Switcher and Manager
	"edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
      ];
    };

    home.file."chromium-flags.conf" = {
      enable = true;
      target = "/home/mew/.config";
      text = ''
        --onzone-platfrom-hint=auto
	--gtk-version=4
	--enable-features=WebUIDarkMode
      '';
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
	"$HOME/data/Pictures/memes"
	"$HOME/data/Videos/memes"
	"$HOME/data/1"
	"$HOME/.local/share/Steam/steamapps/compatdata/"
        "$HOME/.config/chromium"
      ];	
    };
  };
}
