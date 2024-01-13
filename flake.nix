{
  description = "personal multi-user nixos config (WIP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-23.11";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    
    # command-not-found workaround
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/hyprland";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland-contrib.url = "github:hyprwm/contrib";

    split-monitor-workspaces.url = "github:Duckonaut/split-monitor-workspaces";
    split-monitor-workspaces.inputs.nixpkgs.follows = "hyprland";

    impermanence.url = "github:nix-community/impermanence";

    ags.url = "github:aylur/ags";
    matugen.url = "github:InioX/matugen";
  };

  outputs = inputs@{ self, nixpkgs, stable, home-manager, hyprpicker, hyprland-contrib, impermanence, split-monitor-workspaces, ... }: let
    system = "x86_64-linux";
  in
  {
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
