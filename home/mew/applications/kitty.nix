{ config, pkgs, ... }: {
  config = {
    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableFishIntegration = true;
	enableBashIntegration = true;
	enableZshIntegration = true;
      };
      font = {
        name = "fira-code";
	package = pkgs.fira-code;
	size = 12;
      };
      settings = {
        cursor_shape = "beam";
	show_hyperlink_targets = true;
	enable_audio_bell = false;
	background_opacity = "0.9";
	#background_blur = "2";
	shell = "fish";
	editor = "nvim";
	confirm_os_window_close = "0";
	font_features = "FiraCode +cv02 +cv05 +cv09 +cv14 +ss04 +cv16 +cv31 +cv25 +cv26 +cv32 +cv28 +ss10 +zero +onum";
      };
      theme = "Rosé Pine";
    };
  };
}
