{ config, pkgs, ... }: {
  config = {
    users.users.mew = {
      uid = 1001;
      isNormalUser = true;
      home = "/home/mew";
      hashedPassword = "$y$j9T$4hemAQtx7ejdYLhw6yohh/$YO.M0SV7GCOF1fqGGZOXQhxA6lFemZxjZdPzXrTttf0";
      extraGroups = [
        "wheel"
      ];
    };
  };
}

