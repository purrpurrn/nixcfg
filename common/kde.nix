{ config, pkgs, inputs, ... }: {
config = {
    services.xserver.enable = true;
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma6.enable = true;
    services.xserver.desktopManager.plasma6.enableQt5Integration = true;


    environment.plasma6.excludePackages = with pkgs.libsForQt5; [
      plasma-browser-integration
      konsole
    ];
  };
}
