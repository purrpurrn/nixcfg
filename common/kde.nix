{ config, pkgs, inputs, ... }: {
config = {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;
#    services.xserver.desktopManager.plasma6.enableQt5Integration = true;
    services.power-profiles-daemon.enable = false;


    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
      plasma-browser-integration
      konsole
    ];

   environment.systemPackages = [
     pkgs.gnome.gnome-screenshot
   ];
  };
}
