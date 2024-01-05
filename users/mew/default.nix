{ config, pkgs, ... }:
{
  imports = [
    ./pkgs.nix
    ./pwd.nix
  ];

  config = {
    users.users.mew = {
      uid = 1001;
      isNormalUser = true;
      home = "/home/mew";
      extraGroups = [
        "wheel"
      ];
    };
  };
}

