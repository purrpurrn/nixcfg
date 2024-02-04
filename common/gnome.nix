{ config, pkgs, ... }: {
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable  = true;

    hardware.pulseaudio.enable = false;
  };
}
