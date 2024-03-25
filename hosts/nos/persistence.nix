{ inputs, impermanence, config, ... }:
{
  imports = [ inputs.impermanence.nixosModule ];

  config = {
    users.mutableUsers = false;

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
	  ".config/chromium"
	  ".config/1Password"
	  ".config/steamguard-cli"
	  ".config/tofi/"
	  ".config/obsidian"
	  ".config/sops/age"
	  ".config/heroic"
	  ".config/discordWebConfig"
	  ".1password"
	  ".ssh"
	  ".local/share/PrismLauncher"
	  ".local/share/Steam"
	  ".local/share/Anki2"
	  ".local/state/mpv/watch_later"
	  ".local/share/icons"
	  ".icons"
	  "data/Pictures/memes"
	  "data/Pictures/screenshots"
	  "data/Pictures/wallpapers"
	  "data/Pictures/other"
	  "data/Videos"
	  "data/music"
	  "data/recordings"
	  "data/Games/OMORI"
	  "data/Games/Heroic"
	  "data/Documents/obsidian"
	  "data/Documents/pdf"
	  "data/Documents/nixpkgs"
	  "data/Documents/dolis"
	  "data/Documents/misc"
	  "data/Documents/cooklang"
	  "data/Videos/mpv_clips"
	];
	files = [
          ".config/mpv/memo-history.log"
#	  ".config/sops/age/keys.txt"
	];
      };
    };
  };
}
