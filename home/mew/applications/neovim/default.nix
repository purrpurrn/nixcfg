{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./noice.nix
    ./notify.nix
    ./lualine.nix
  ];
  config = {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      enableMan = true;
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
      globals = {
        mapleader = " ";
      };
      colorschemes = {
        rose-pine = {
	  enable = true;
          transparentBackground = true;
	};
      };
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
	  enable = false;
	  colorscheme = "rosepine";
	};
        nvim-colorizer = {
          enable = true;
	  userDefaultOptions.mode = "foreground";
	};
	treesitter.enable = true;
        trouble.enable = true;
	telescope = {
          enable = true;
	  defaults = {
            prompt_prefix = " ";
	    selection_caret = " ";
	  };
	};
	neo-tree.enable = false;
	oil.enable = true;
	luasnip.enable = true;
	image.enable = true;
	vimtex.enable = true;
	lsp = {
          enable = true;
	  servers = {
            tsserver.enable = true; # javascript & typescript
	    nil_ls.enable = true; # nix programming language
	  };
	};
	nvim-cmp = {
          enable = true;
	  autoEnableSources = true;
	  sources = [
            { name = "nvim_lsp"; }
	    { name = "path"; }
	    { name = "buffer"; }
	  ];
	};
      };
      extraPlugins = with pkgs.vimPlugins; [
	#base16-nvim
        nvim-web-devicons
	twilight-nvim
	neoscroll-nvim
      ];
    };
  };
}
