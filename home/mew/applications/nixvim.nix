{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  config = {
    programs.nixvim = {
      enable = true;
      colorschemes.rose-pine.enable = true;
      colorschemes.rose-pine.transparentBackground = true;
      keymaps = [
        {
          key = "<leader>ff";
	  action = "<cmd>Telescope find_files<cr>";
	}
	{
          key = "<leader>fg";
	  action = "<cmd>Telescope live_grep<cr>";
	}
	{
          key = "<leader>fb";
	  action = "<cmd>Telescope buffers<cr>";
	}
	{
          key = "<leader>fh";
	  action = "<cmd>Telescope help_tags<cr>";
	}
      ];
      options = {
        number = true;
	relativenumber = true;
        clipboard = "unnamedplus";
	undofile = true;
	termguicolors = true;
        signcolumn = "no";
      };
      plugins = {
        lightline = {
	  enable = true;
	  colorscheme = "rose-pine";
	};
	treesitter.enable = true;
        trouble.enable = true;
	telescope.enable = true;
	neo-tree.enable = true;
	image.enable = true;
	lsp = {
          enable = true;
	  servers = {
            #tsserver = true; # javascript
	    nil_ls.enable = true; # nix programming language
	  };
	};
      };
      extraPlugins = with pkgs.vimPlugins; [
        nvim-web-devicons
      ];
    };
  };
}
