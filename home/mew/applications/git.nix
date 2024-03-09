{ config, pkgs, ... }: {
  config = {
    programs.git = {
      enable = true;
      userName = "purrpurrn";
      userEmail = "scrcpynovideoaudiocodecraw+hdmzwl@gmail.com";
      extraConfig = {
        gpg."ssh".program = "${pkgs._1password-gui}/bin/op-ssh-sign";
	core.editor = "nvim";
      };
    };
  };
}
