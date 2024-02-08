{ config, pkgs, ... }: {
  config = {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "rose-pine";
        theme_background = false;
	truecolor = true;
      };
    };

    xdg.configFile."Rosé Pine" = {
      enable = true;
      target = "btop/themes/rose-pine.theme";
      text = builtins.readFile(builtins.fetchurl {
        url = "https://raw.githubusercontent.com/rose-pine/btop/main/rose-pine.theme";
	sha256 = "sha256:1injry07mx683f1cy2ks73rdiv4dfi8b5ija8bq6adhbgcw7b1h8";
      });
    };
  };
}
