{ pkgs, config, inputs, ... }: {
  imports = [
    #./gtk.nix
    ./mail.nix
    ./base16.nix
    ./directories.nix
    ./applications/mpv
    ./applications/prism
    ./applications/neovim
    ./applications/discord
    ./applications/chromium
    ./applications/bubblewrapper
    ./applications/git.nix
    ./applications/obs.nix
    ./applications/ags.nix
#    ./applications/zsh.nix
    ./applications/fish.nix
    ./applications/btop.nix
    ./applications/kitty.nix
    ./applications/nushell.nix
    ./applications/hyprlock.nix
    ./applications/hypridle.nix
#    ./applications/hoyoverse.nix
#    ./applications/hyprpaper.nix
    #./applications/hyprcursor.nix
    ./applications/easyeffects.nix
#    ./applications/vesktop.nix
#    ./applications/chrome.nix
#    ./applications/hyprland.nix  
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
        pkgs.unp
	pkgs.gpu-screen-recorder
	pkgs.gpu-screen-recorder-gtk
	pkgs.pinentry-gnome
	pkgs.nodejs_21
	pkgs.temurin-bin-21
	pkgs.p7zip
	pkgs.unar
	pkgs.libnotify
        pkgs.cook-cli
        pkgs.heroic
        pkgs.swaybg
        pkgs.ff2mpv
        pkgs.blender
        pkgs.wl-clipboard
        inputs.hyprland-contrib.packages."x86_64-linux".grimblast 
        inputs.hyprpicker.packages."x86_64-linux".hyprpicker
	inputs.hyprcursor.packages."x86_64-linux".hyprcursor
	pkgs.pulseaudio
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
