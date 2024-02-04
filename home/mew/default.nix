{ pkgs, config, inputs, ... }: {
  imports = [
    ./gtk.nix
    ./directories.nix
    ./applications/mpv
    ./applications/kitty.nix
    ./applications/zsh.nix
    ./applications/fish.nix
    ./applications/nushell.nix
    ./applications/git.nix
    ./applications/nixvim.nix
    ./applications/ags.nix
    ./applications/chromium.nix
    ./applications/easyeffects.nix
    ./applications/hyprpaper.nix
    ./applications/bubblewrapper/default.nix
#    ./applications/vesktop.nix
#    ./applications/chrome.nix
#    ./applications/hyprland.nix  
    ./applications/prism
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
        pkgs.blender
        pkgs.wl-clipboard
        inputs.hyprland-contrib.packages."x86_64-linux".grimblast 
        inputs.hyprpicker.packages."x86_64-linux".hyprpicker
	pkgs.btop
	pkgs.neofetch
	pkgs.prismlauncher
	pkgs.firefox
	pkgs.krita
	pkgs.kitty
	pkgs.steamguard-cli
	pkgs.fzy
	pkgs.fd
	pkgs.rofi-wayland
	pkgs.obsidian
	pkgs.yt-dlp
	pkgs.scrcpy
	pkgs.anki
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

    xdg.mimeApps = {
      enable = true;
    };
  };
}
