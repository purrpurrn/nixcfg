{ config, pkgs, ... }:
{
  imports = [
    ./pkgs
    ./persistence.nix
  ];

  config = {
    time.timeZone = "Europe/Berlin";

    # Internationalisation properties
    i18n.defaultLocale = "en_DK.UTF-8";

    services.printing.enable = true;

    users.mutableUsers = false;

    # Allows Unfree/Proprietary packages
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = _: true;
    environment.sessionVariables = { NIXPKGS_ALLOW_UNFREE = "1"; };

    nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enables flakes
  
    # Sound/Speaker Settings
    services.pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    
    fonts.packages = [
      pkgs.fira-code
      pkgs.fira-code-nerdfont
    ];
  };
}
