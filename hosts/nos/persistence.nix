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
	  ".config/google-chrome" # remove
	  ".config/chromium"
	  ".config/1Password"
	  ".config/steamguard-cli"
	  ".config/tofi/"
	  ".config/obsidian"
	  ".1password"
	  ".ssh"
	  ".local/share/PrismLauncher"
	  ".local/share/Steam"
	  "data/Pictures/memes"
	  "data/Pictures/screenshots"
	  "data/Pictures/wallpapers"
	  "data/Pictures/other"
	  "data/Videos"
	  "data/Games/OMORI"
	  "data/Documents/obsidian"
	  "data/Documents/pdf"
	];
	files = [
          ".config/sops/age/keys.txt"
	];
      };
    };
  };
}
