{ config, pkgs, ... }:
{
  imports = [
    ./mew
  ];

  # Root user
  users.users.root.initialPassword = "123";
}
