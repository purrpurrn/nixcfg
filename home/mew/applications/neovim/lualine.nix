{ config, pkgs, ... }: {
  config = {
    programs.nixvim.plugins.lualine = {
      enable = true;
      extensions = [
        "fzf"
	"oil"
	"trouble"
      ];
      iconsEnabled = true;
      theme = "base16";
    };
  };
}
