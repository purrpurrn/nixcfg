{ config, lib, pkgs, ... }: {
  config = {
    home.packages = [ pkgs.vesktop ];

    security.bubblewrap.desktopFiles.vesktop = {
        name = "Discord";
        source = "${pkgs.vesktop}/bin/vencorddesktop";
        targetName = "Discord";
    };
    security.bubblewrap.programs.vesktop = {
      home = false;
      dbus = true;
      network = true;
      gui = true;
      webcam = false;
      audio = true;
#      devices = [
#        "/dev/pcmC1D0p"
#      ];
      readWriteDirs = [
        "$HOME/.config/VencordDesktop"
	"$HOME/data/1"
      ];
      #readonlyDirs = [
      #];
      command = "${pkgs.vesktop}/bin/vencorddesktop";
      args = [ "--enable-features=UseOzonePlatform --ozone-platform=wayland" ];
    };
  };
}
