{ inputs, pkgs, config, lib, ... }: {
  imports = [
    ./applications/mpv/default.nix
    ./applications/kitty.nix
    ./applications/fish.nix
    ./applications/git.nix
    ./applications/nixvim.nix
    ./applications/ags.nix
    ./applications/bubblewrapper/default.nix
    ./applications/bubblewrapper/vesktop.nix
    ./applications/bubblewrapper/chrome.nix
#    ./applications/bubblewrapper/1password.nix
#    ./applications/hyprland.nix  
    ./gtk.nix
  ];

  config = {
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
	pkgs.firefox
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
