{ config, pkgs, inputs, ... }: {
  imports = [
    inputs.bubblewrapper.homeModule
  ];
  config = {
    security.bubblewrap.programs = {};
  };
}
