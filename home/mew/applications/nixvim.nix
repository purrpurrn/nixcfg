{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  config = {
    programs.nixvim = {
      enable = true;
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
      };
      plugins = {
        lightline.enable = true;
	treesitter.enable = true;
        trouble.enable = true;
	telescope.enable = true;
      };
    };
  };
}
