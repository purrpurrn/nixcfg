{ config, pkgs, ... }:
{
  imports = [
    ./pkgs
    ./persistence.nix
  ];

  config = {
    users.mutableUsers = false;
  };
}
