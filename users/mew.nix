{ config, pkgs, ... }: {
  config = {
    users.users.mew = {
      uid = 1001;
      isNormalUser = true;
      home = "/home/mew";
      hashedPasswordFile = config.sops.secrets.mew_password.path;
      extraGroups = [
        "wheel"
      ];
    };
  };
}

