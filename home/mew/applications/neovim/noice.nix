{ config, pkgs, ... }: {
  config = {
    programs.nixvim = {
    highlight = {
      NoiceCmdlinePopupBorder = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdlinePopupTitle = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdline = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdlineIcon = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdlineIconInput = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdlinePopupBorderSearch = {
        fg = "#${config.colorScheme.palette.base03}";
      };
      NoiceCmdlineIconSearch = {
        fg = "#${config.colorScheme.palette.base03}";
      };
    };
      plugins = {
	noice = {
          enable = true;
          routes = [
            {
              filter = {
              event = "msg_show";
              any = [
                  { find = "%d+L, %d+B"; }
                  { find = "; after #%d+"; }
                  { find = "; before #%d+"; }
                  { find = "%d fewer lines"; }
                  { find = "%d more lines"; }
                ];
	      };
	    }
          ];
	};
      };
    };
  };
}
