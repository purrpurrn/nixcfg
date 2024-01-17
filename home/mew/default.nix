{ inputs, pkgs, config, lib, ... }: {
  imports = [
    ./applications/mpv
    ./applications/kitty.nix
    ./applications/fish.nix
    ./applications/git.nix
    ./applications/nixvim.nix
    ./applications/ags.nix
    ./applications/chromium.nix
    ./applications/easyeffects.nix
    ./applications/bubblewrapper/default.nix
    ./applications/vesktop.nix
    ./applications/bubblewrapper/chrome.nix
#    ./applications/bubblewrapper/1password.nix
#    ./applications/hyprland.nix  
    ./gtk.nix
    ./prism
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
	pkgs.firefox
	pkgs.kitty
	pkgs.steamguard-cli
	pkgs.fzy
	pkgs.fd
	pkgs.tofi
	pkgs.obsidian
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
