{ config, pkgs, ... }: {
  config = {
    programs.nushell = {
      enable = true;
    };
  };
}
