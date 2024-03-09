{ config, pkgs, inputs, ... }: {
  config = {
    home.packages = [ inputs.hypridle.packages."x86_64-linux".hypridle ];
    xdg.configFile."hypridle.conf" = {
      enable = true;
      target = "/home/mew/.config/hypr/hypridle.conf";
      text = ''
        general {
          lock_cmd = hyprlock
	}

        listener {
          timeout = 300 # 5 min
	  on-timeout = hyprlock
	  on-resume = notify-send "Unlocked!"
	}

	listener {
          timeout = 350 # 5.5 min
	  on-timeout = hyprctl dispatch dpms off # screen off
	  on-resume = hyprctl dispatch dpms on # screen on
        }

        listener {
          timeout = 450 # 7.5 min
	  on-timeout = systemctl suspend
	}
      '';
    };
  };
}
