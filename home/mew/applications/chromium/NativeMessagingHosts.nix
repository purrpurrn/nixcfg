{ config, pkgs, ... }: {
  config = {
    xdg.configFile."ff2mpv-chromium.json" = {
      enable = true;
      target = "chromium/NativeMessagingHosts/ff2mpv.json";
      text = ''
        {
          "name": "ff2mpv",
	  "description": "ff2mpv's external manifest",
	  "path": "${pkgs.ff2mpv}/bin/ff2mpv.py",
	  "type": "stdio",
	  "allowed_origins": [
             "chrome-extension://ephjcajbkgplkjmelpglennepbpmdpjg/"
	  ]
	}
      '';
    }; 
  };
}
