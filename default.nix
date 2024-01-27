{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.home-manager.nixosModule
  ];

  config = {
    home-manager = {
      extraSpecialArgs = inputs // { inherit inputs; };
      useGlobalPkgs = true;

      users = {
        mew = { ... }: {
          imports = [ 
	    ./home/mew 
	  ];
        };
      };
    };
  };
}
