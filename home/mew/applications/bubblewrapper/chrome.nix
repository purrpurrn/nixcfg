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
        "/home/mew/.config/google-chrome"
	"/home/mew/data/1"
	"/home/mew/data/Videos"
	"/home/mew/data/Pictures"
      ];
      hideDirs = [
        "/home/mew"
      ];
      command = "${pkgs.google-chrome}/bin/google-chrome-stable";
      availablePackages = [
        pkgs._1password
      ];
    };
  };
} 
