{ config, pkgs, ... }:
{
  imports = [
    ./hyprland.nix
  ];
  environment.systemPackages = with pkgs; [
    foot
    neovim
    ntfs3g
  ];
}
