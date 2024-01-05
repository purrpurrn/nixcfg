{ pkgs ? import <nixpkgs> {}, runCommand ? pkgs.runCommand }:
runCommand  "rtl_alc236" {} ''
  mkdir -p $out/lib/firmware
  cp ${./hda-jack-retask.fw} $out/lib/firmware/hda-jack-retask.fw
''
