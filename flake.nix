{
  description = "personal multi-user nixos config (WIP)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    nh.url = "github:viperML/nh";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    
    # command-not-found workaround
    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    hoyoverse.url = "github:ezKEa/aagl-gtk-on-nix";
    hoyoverse.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/hyprland/ae17e900e720430c7848faf1b6e21b5f352c26ca";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";
    prism.url = "github:IogaMaster/prism";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprland-contrib.url = "github:hyprwm/contrib";
    hyprlock.url = "github:hyprwm/hyprlock";
    hyprlock.inputs.nixpkgs.follows = "nixpkgs";
    hypridle.url = "github:hyprwm/hypridle";
    hyprcursor.url = "github:hyprwm/hyprcursor/1a1fcfb58db580f32a5e1ac1963b78c2cc1379e3";
    hyprcursor.inputs.nixpkgs.follows = "nixpkgs";

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
