{ config, pkgs, inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./persistence.nix
    ./openssh.nix
    ../../users/mew.nix
#    ../../common/kde.nix
    ../../common/1password.nix
    ../../common/steam.nix
    ../../common/gtk.nix
#    ../../common/gnome.nix
    ../../common/hyprland.nix
    ../../common/kdeconnect.nix
#    ../../common/agenix.nix
    inputs.flake-programs-sqlite.nixosModules.programs-sqlite # command-not-found workaround
  ];
   config = {
     nix.settings.sandbox = true;

     # Auto Updates
     system.autoUpgrade = {
       enable = true;
       flake = inputs.self.outPath;
       dates = "02:00";
       flags = [
         "--update-input"
	 "nixpkgs"
       ];
     };

     services.logind = {
       lidSwitch = "suspend";
       powerKeyLongPress = "reboot";
     };

     # Power Management
     powerManagement.enable = true;
     services.tlp.enable = true;
     services.tlp.settings = {
       CPU_SCALING_GOVERNOR_ON_BAT="powersave";
       CPU_SCALING_GOVERNOR_ON_AC="performance";

       CPU_MAX_PERF_ON_AC=100;
       CPU_MAX_PERF_ON_BAT=40;
     };

     # Networking
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
#      (pkgs.callPackage ../../zep.nix { })
      pkgs.bluez 
      pkgs.libsForQt5.polkit-kde-agent
      pkgs.killall
      pkgs.jq
      pkgs.btop
      pkgs.gtklock
      pkgs.htop
      pkgs.fd
      pkgs.ripgrep
      # gtk theme
      pkgs.adw-gtk3
      pkgs.libadwaita
      pkgs.gnome.adwaita-icon-theme 
      pkgs.adwaita-qt
      pkgs.tree
      pkgs.vulkan-tools
    ];

    # Internationalisation properties
    time.timeZone = "Europe/Berlin";
    i18n.defaultLocale = "en_DK.UTF-8";

    services.printing.enable = true;

    fonts.packages = [
      pkgs.helvetica-neue-lt-std
      pkgs.vistafonts
      pkgs.fira-code
      pkgs.fira-code-nerdfont
    ];

    system.stateVersion = "23.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enables flakes
    # Allows Unfree/Proprietary packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = (_: true);
    environment.sessionVariables = { NIXPKGS_ALLOW_UNFREE = "1"; };
    nixpkgs.config.allowBroken = true;
    nixpkgs.config.permittedInsecurePackages = [
      "electron-25.9.0"
      "electron-23.3.13"
    ];
   };
}
