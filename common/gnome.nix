{ config, pkgs, lib, ... }: {
  config = {
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable  = true;
    services.power-profiles-daemon.enable = lib.mkForce false;

    environment.systemPackages = [
      pkgs.gnome.gnome-session
    ];

    hardware.pulseaudio.enable = false;
  };
}
