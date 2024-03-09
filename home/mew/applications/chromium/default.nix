{ config, pkgs, ... }: {
  imports = [
    ./NativeMessagingHosts.nix
  ];
  config = {
    programs.chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WebUIDarkMode --ozone-platform=wayland --force-dark-mode"
      ];
      dictionaries = [ 
        pkgs.hunspellDictsChromium.en_US 
        pkgs.hunspellDictsChromium.de_DE
      ];
      extensions = [
        "fnbkeopcpjainobjebddfcnnknmfipid" # Pixiv Downloader
        "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
        "pncfbmialoiaghdehhbnbhkkgmjanfhe" # uBlacklist
        "gebbhagfogifgggkldgodflihgfeippi" # Return Youtube Dislikes
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
        "bhchdcejhohfmigjafbampogmaanbfkg" # User-Agent Switcher and Manager
	"edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
	"kbmfpngjjgdllneeigpgjifpgocmfgmb" # Reddit Enhancement Suite
	"khncfooichmfjbepaaaebmommgaepoid" # Unhook - Remove YouTube Recommended Videos
	"ephjcajbkgplkjmelpglennepbpmdpjg" # ff2mpv
	"dbgeolnmmjmhcfndmmahnpicpmnpibep" # FF: Fuzzy finder for Chrome tabs and windows
      ];
    };
  };
}
