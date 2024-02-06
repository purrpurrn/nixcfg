{ config, pkgs, inputs, lib, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  environment.systemPackages = [
    pkgs.sops
  ];

  sops.defaultSopsFile = ../secrets/secrets.yaml; 
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/nix/persist/home/mew/.config/sops/age/keys.txt";
  sops.secrets.mew_password = {};
}
