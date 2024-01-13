{ inputs, lib, config, pkgs, ... }: {
   
  config = {
    security.bubblewrap.programs.google-chrome = {
      home = true;
      dbus = true;
      gui = true;
      audio = false;
      webcam = false;
      network = true;
      command = "${pkgs.google-chrome}/bin/google-chrome-stable";
      args = [];
    };
  };
} 
