{ lib, config, pkgs, ... }: {
  options = with lib; {
    user."0" = mkOption {
      type = types.str;
      default = "mew";
      description = ''
        the name of the user 0
      '';
    };
  };
}
