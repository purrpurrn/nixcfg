{ config, lib, pkgs, ... }: {
  config = {
    security.bubblewrap.programs.vesktop = {
      home = true;
      dbus = true;
      network = true;
      webcam = false;
      audio = true;
      command = "${pkgs.vesktop}/bin/vencorddesktop";
    };
  };
}
