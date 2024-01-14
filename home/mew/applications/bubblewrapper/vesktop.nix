{ config, lib, pkgs, ... }: {
  config = {
    security.bubblewrap.programs.vesktop = {
      home = false;
      dbus = true;
      network = true;
      gui = true;
      webcam = false;
      audio = false;
#      devices = [
#        "/dev/pcmC1D0p"
#      ];
      readWriteDirs = [
        "/home/mew/.config/VencordDesktop"
        "/run/opengl-driver"
	"/home/mew/data/1"
      ];
      #readonlyDirs = [
      #];
      command = "${pkgs.vesktop}/bin/vencorddesktop";
    };
  };
}
