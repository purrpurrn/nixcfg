{ config, pkgs, ... }: {
  config = {
    environment.systemPackages = [
      pkgs.retroarchBare
      pkgs.retroarch-assets
    ];
    nixpkgs.config.retroarch = {
      enableswansation = true;
      enablepcsx2 = true;
    };
  };
}
