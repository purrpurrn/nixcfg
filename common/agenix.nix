{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.agenix.nixosModules.default
  ];

  config = {
    age.secrets.mew_password.file = ../secrets/mew_password;
    age.identityPaths = [ "/home/mew/.ssh/id_ed25519" ];

    environment.systemPackages = [ 
      inputs.agenix.packages.x86_64-linux.default 
    ];
  };
}
