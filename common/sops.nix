{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    environment.systemPackages = [
      pkgs.sops
    ];

 #   systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];

    sops.defaultSopsFile = ../secrets/secrets.yaml; 
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/nix/persist/home/mew/.config/sops/age/keys.txt";
    sops.secrets.mew_password = {};
  };
}
