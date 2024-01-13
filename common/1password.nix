{ config, pkgs, ... }:
{
  programs._1password-gui.enable = true;
  programs._1password-gui.polkitPolicyOwners = ["mew"];
  programs._1password.enable = true;

  environment.sessionVariables = {
    SSH_AUTH_SOCK = "~/.1password/agent.sock";
  };
}
