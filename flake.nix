{
  description = "personal multi-user nixos config (WIP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-23.11";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    
    # command-not-found workaround
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    hoyoverse.url = "github:ezKEa/aagl-gtk-on-nix";
    hoyoverse.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/hyprland/66330281ff19e84c986c5ce639b670929e5dadd6";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    prism.url = "github:IogaMaster/prism";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprlock.inputs.nixpkgs.follows = "nixpkgs";
    hypridle.url = "github:hyprwm/hypridle";
    hyprcursor.url = "github:hyprwm/hyprcursor/ea1c1ff8973f0326266fa27e6a081b8acd0d306b";

    nix-colors.url = "github:misterio77/nix-colors";

    split-monitor-workspaces.url = "github:Duckonaut/split-monitor-workspaces";

    impermanence.url = "github:nix-community/impermanence";
    agenix.url = "github:ryantm/agenix";
    bubblewrapper.url = "git+https://git.sr.ht/~cid-chan/bubblewrapper?ref=main";
    schizofox.url = "github:schizofox/schizofox";

    ags.url = "github:aylur/ags";
    matugen.url = "github:InioX/matugen";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprpicker, hyprland-contrib, impermanence, split-monitor-workspaces, ... }: let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      # personal laptop
      nos = nixpkgs.lib.nixosSystem {
        modules = [ 
	  ./hosts/nos 
	  ./home/users.nix
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
