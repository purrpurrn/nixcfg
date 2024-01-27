{ fetchFromGitHub
, lib
, stdenvNoCC
, unstableGitUpdater
}:

stdenvNoCC.mkDerivation {
  pname = "evafast";
  version = "2022-10-11";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "evafast";
    rev = "f9ee7e41dedf0f65186900e0ccdd6ca6a8ced7ed";
    hash = "1wn2ngcvn7wcsl3kmj782x5q9130qw951lj6ilrkafp6q6zscpqr";
  };
  passthru.updateScript = unstableGitUpdater {};

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp -r evafast.lua $out/share/mpv/scripts/
  '';

  passthru.scriptName = "evafast.nix";

 # meta = with lib; {
 #   description = "Fast-forwarding and seeking on a single key, with quality of life features like a slight slowdown when subtitles are shown.":
 #   homepage = "https://github.com/po5/evafast";
 #   license = licenses.unfree
 #   platforms = platforms.all;
 # };
}


