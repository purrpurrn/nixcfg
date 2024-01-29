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
    prism.url = "github:IogaMaster/prism";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland-contrib.url = "github:hyprwm/contrib";

    split-monitor-workspaces.url = "github:Duckonaut/split-monitor-workspaces";

    impermanence.url = "github:nix-community/impermanence";
    bubblewrapper.url = "git+https://git.sr.ht/~cid-chan/bubblewrapper?ref=main";
    sops-nix.url = "github:Mic92/sops-nix";

    ags.url = "github:aylur/ags";
    matugen.url = "github:InioX/matugen";

    niri.url = "github:sodiboo/niri-flake";
    #niri.url = "github:YaLTeR/niri";
  };

  outputs = inputs@{ self, nixpkgs, stable, home-manager, hyprpicker, hyprland-contrib, impermanence, split-monitor-workspaces, ... }: let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      # personal laptop
      nos = nixpkgs.lib.nixosSystem {
        modules = [ 
	  ./hosts/nos 
	  ./home/users.nix
	  ./common/sops.nix
	];
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
