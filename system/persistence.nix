{ inputs, impermanence, config, ... }:
{
  imports = [ inputs.impermanence.nixosModule ];

  config = {
    environment.persistence."/nix/persist" = {
      hideMounts = true; # hides whitelisted directories and files from commmands like "lsblk".
      directories = [
        "/etc/nixos"
	"/etc/NetworkManager/system-connections"
      ];
      files = [
        "/etc/machine-id"
      ];
      users.mew = {
        directories = [
          ".config/hypr"
          ".config/ags"
	  ".config/VencordDesktop"
	  ".config/google-chrome"
	  ".config/1Password"
	  ".config/steamguard-cli"
	  ".1password"
	  ".ssh"
	  ".local/share/PrismLauncher"
	  ".local/share/Steam"
	  # Fish
	  ".local/share/fish"
	  ".config/fish"
	  "data/Pictures"
	  "data/Videos"
	  "data/Games"
	  "data/1"
	];
      };
    };
  };
}
