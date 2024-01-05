{ config, pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../users
    # pkgs
    ../../common/optional/1password.nix
  ];

  networking.hostName = "nos";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  security.polkit.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false; # set to false out of security reasons
  boot.loader.timeout = 1;
  boot.loader.efi.canTouchEfiVariables = true; # Installation process is allowed to modify EFI boot variables.
  boot.binfmt.emulatedSystems = ["aarch64-linux"];


  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  environment.systemPackages = [ 
    pkgs.bluez 
    pkgs.libsForQt5.polkit-kde-agent
  ];

  system.stateVersion = "23.05";
}
