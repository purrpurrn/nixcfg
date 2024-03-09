{ config, pkgs, ... }: {
  config = {
    programs.nixvim = {
    highlight = {
      NotifyWARNBorder = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NotifyWARNTitle = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NotifyWARNIcon = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NotifyINFOBorder = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NotifyINFOTitle = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NotifyINFOIcon = {
        fg = "#${config.colorScheme.palette.base03}";
      };
    };
      keymaps = [
	{
          key = "<leader>fn";
	  action = "<cmd>Telescope notify<cr>";
	}
      ];
      plugins = {
	notify = {
          enable = true;
	  render = "default";
	  backgroundColour = "#${config.colorScheme.palette.base0F}";
	  level = 2;
	  maxWidth = 400;
	  stages = "fade";
	  timeout = 2500;
	};
      };
    };
  };
}
