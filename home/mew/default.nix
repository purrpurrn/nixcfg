{ pkgs, config, ... }: {
  imports = [
    ./applications/mpv
    ./applications/kitty.nix
    ./applications/fish.nix
    ./applications/git.nix
    ./applications/nixvim.nix
    ./applications/ags.nix
    ./applications/chromium.nix
#    ./applications/easyeffects.nix
    ./applications/hyprpaper.nix
    ./applications/bubblewrapper/default.nix
    ./applications/vesktop.nix
    ./applications/chrome.nix
#    ./applications/hyprland.nix  
    ./applications/prism
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
	pkgs.btop
	pkgs.neofetch
	pkgs.prismlauncher
	pkgs.firefox
	pkgs.kitty
	pkgs.steamguard-cli
	pkgs.fzy
	pkgs.fd
	pkgs.rofi-wayland
	pkgs.obsidian
	(pkgs.callPackage ../../common/pomo.nix {})
      ];
    };
    xdg.userDirs = {
      enable = true;
      pictures = "$HOME/data/Pictures";
      videos = "$HOME/data/Videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "$HOME/data/Pictures/Screenshots";
	XDG_CONFIG_HOME = "$HOME/.config";
      };
    };
  };
}
