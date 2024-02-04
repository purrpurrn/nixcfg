{ config, pkgs, lib, ... }: {
  config = {
    programs.zsh = {
      enable = true;
      enableAutosuggestions = true;
      autocd = true;
      plugins = [
        {
          name = "powerlevel10k";
	  file = "powerlevel10k.zsh-theme";
	  src = pkgs.fetchFromGitHub {
            owner = "romkatv";
	    repo = "powerlevel10k";
	    rev = "v1.20.0";
	    sha256 = "sha256-ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
	  };
	}
      ];
    };
  };
}
