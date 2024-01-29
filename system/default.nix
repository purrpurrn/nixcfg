{ config, pkgs, ... }:
{
  imports = [
    ./pkgs
  ];

  config = {
    users.mutableUsers = false;
  };
}
