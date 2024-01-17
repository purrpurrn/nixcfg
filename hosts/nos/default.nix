{ config, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../users
    ../../common/1password.nix
    ../../common/steam.nix
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite # command-not-found workaround
  ];
   config = {
     networking.hostName = "nos";
     networking.networkmanager.enable = true;
     systemd.services.NetworkManager-wait-online.enable = false; # reduces boot time

     security.polkit.enable = true;

     # Bootloader
     boot.loader.systemd-boot.enable = true;
     boot.loader.systemd-boot.editor = false; # set to false out of security reasons
     boot.loader.timeout = 2;
     boot.loader.efi.canTouchEfiVariables = true; # Installation process is allowed to modify EFI boot variables.

     boot.binfmt.emulatedSystems = ["aarch64-linux"]; # arm64 emulation

    environment.systemPackages = [ 
      pkgs.bluez 
      pkgs.libsForQt5.polkit-kde-agent
      pkgs.killall
      pkgs.jq
      pkgs.btop
      pkgs.htop
      pkgs.fd
      pkgs.ripgrep
      pkgs.wget
    ];

    # Internationalisation properties
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_DK.UTF-8";

    services.printing.enable = true;

    fonts.packages = [
      pkgs.fira-code
      pkgs.fira-code-nerdfont
    ];

    system.stateVersion = "23.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enables flakes
    # Allows Unfree/Proprietary packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = _: true;
    environment.sessionVariables = { NIXPKGS_ALLOW_UNFREE = "1"; };
   };
}
