{ config, pkgs, inputs, ... }: {
  config = {
    home.packages = [ inputs.hyprlock.packages."x86_64-linux".hyprlock ];
    xdg.configFile."hyprlock.conf" = {
      enable = true;
      target = "hypr/hyprlock.conf";
      text = ''
        general {
          hide_cursor = true
	}

        background {
          monitor = 
          path = screenshot

          # Blur
          blur_passes = 4
          blur_size = 4
          noise = 0.05
        }
      '';
    };
  };
}
