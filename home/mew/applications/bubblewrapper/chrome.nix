{ inputs, lib, config, pkgs, ... }: {
   
  config = {
    security.bubblewrap.programs.google-chrome = {
      home = true;
      dbus = true;
      gui = true;
      audio = true;
      webcam = false;
      network = true;
      readWriteDirs = [
        "$HOME/.config/google-chrome"
	"$HOME/data/1"
	"$HOME/data/Videos"
	"$HOME/data/Pictures"
      ];
      hideDirs = [
        "$HOME"
      ];
      command = "${pkgs.google-chrome}/bin/google-chrome-stable";
      args = ["--enable-features=UseOzonePlatform --ozone-platform=wayland"]; # chrome wayland native mode
      availablePackages = [
        pkgs._1password
      ];
    };
  };
} 
