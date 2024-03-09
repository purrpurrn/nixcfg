{ config, pkgs, ... }: {
  config = {
    services.openssh = {
      enable = true;
      hostKeys = [
        {
          comment = "agenix ssh key";
	  path = "/etc/ssh/agenix_id_ed25519";
	  rounds = 100;
	  type = "ed25519";
	}
      ];
    };
  };
}
