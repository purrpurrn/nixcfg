{ config, pkgs, ... }: {
  config = {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
      '';
      plugins = [
         {
           name = "tide";
	   src = pkgs.fishPlugins.tide.src;
	 }
      ];
    };
  };
}
