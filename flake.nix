{
  description = "personal multi-user nixos config (WIP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland-contrib.url = "github:hyprwm/contrib";

    impermanence.url = "github:nix-community/impermanence";

    ags.url = "github:aylur/ags";
  };

  outputs = inputs@{ self, nixpkgs, stable, home-manager, hyprpicker, hyprland-contrib, impermanence, ... }: {
    nixosConfigurations = {
      # personal laptop
      nos = nixpkgs.lib.nixosSystem {
        modules = [ ./hosts/nos ];
        specialArgs = { inherit inputs; };
      };
    };
    homeConfigurations = {
      "mew@nos" = home-manager.lib.homeManagerConfiguration { 
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [ ./home/mew/default.nix ];
	extraSpecialArgs = { inherit inputs; };
      };
    };
  };
}
