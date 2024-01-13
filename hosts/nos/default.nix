{ config, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../users
    ../../common/1password.nix
    ../../common/steam.nix
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite # command-not-found workaround
  ];

  networking.hostName = "nos";
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  security.polkit.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;
  
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false; # set to false out of security reasons
  boot.loader.timeout = 1;
  boot.loader.efi.canTouchEfiVariables = true; # Installation process is allowed to modify EFI boot variables.

  boot.binfmt.emulatedSystems = ["aarch64-linux"]; # arm64 emulation
  
  # Swap
  swapDevices = [{
    device = "/dev/nvme0n1p5";
    randomEncryption.enable = true;
  }];


  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  environment.systemPackages = [ 
    pkgs.bluez 
    pkgs.libsForQt5.polkit-kde-agent
    pkgs.killall
    pkgs.jq
    pkgs.btop
    pkgs.htop
    pkgs.fd
    pkgs.ripgrep
  ];

  system.stateVersion = "23.05";
}
