{ inputs, pkgs, config, lib, ... }: {
  imports = [
    ./applications/mpv.nix
    ./applications/kitty.nix
    ./applications/fish.nix
    ./applications/git.nix
    ./applications/nixvim.nix
#    ./applications/hyprland.nix  
    ./gtk.nix
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
	pkgs.steamguard-cli
	pkgs.fzy
	pkgs.fd
      ];
    };
    xdg.userDirs = {
      enable = true;
      pictures = "/home/mew/data/Pictures";
      videos = "/home/mew/data/Videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "/home/mew/data/Pictures/Screenshots";
      };
    };
  };
}
