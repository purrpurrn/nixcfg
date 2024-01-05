{ inputs, pkgs, config, lib, ... }: {
  imports = [
    ./applications/mpv.nix
    ./applications/kitty.nix
    ./applications/fish.nix
    ./applications/nix-index.nix
    ./applications/git.nix
  ];

  config = {
    programs.command-not-found.enable = lib.mkForce false;

    home = {
      username = "mew";
      homeDirectory = "/home/mew";
      stateVersion = "23.05";
      sessionVariables = {
        EDITOR = "nvim";
      };
      
      packages = [
        pkgs.google-chrome
	pkgs.btop
	pkgs.neofetch
	pkgs.prismlauncher
	pkgs.swaybg
	pkgs.vesktop
	pkgs.kitty
      ];
    };
  };
}
