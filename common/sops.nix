{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    environment.systemPackages = [
      pkgs.sops
    ];

    sops.defaultSopsFile = ../secrets/secrets.yaml; 
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/mew/.config/sops/age/keys.txt";
    sops.secrets.mew_password = {
      neededForUsers = true;
    };
  };
}
