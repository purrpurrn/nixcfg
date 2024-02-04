{ fetchFromGitHub
, lib
, stdenv
}:

stdenv.mkDerivation {
  pname = "evafast";
  version = "2022-10-11";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "evafast";
    rev = "f9ee7e41dedf0f65186900e0ccdd6ca6a8ced7ed";
    sha256 = "1wn2ngcvn7wcsl3kmj782x5q9130qw951lj6ilrkafp6q6zscpqr";
  };

  installPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp -r evafast.lua $out/share/mpv/scripts
  '';

  dontBuild = true;

  passthru.scriptName = "evafast.lua";

 # meta = with lib; {
 #   description = "Fast-forwarding and seeking on a single key, with quality of life features like a slight slowdown when subtitles are shown.":
 #   homepage = "https://github.com/po5/evafast";
 #   license = licenses.unfree
 #   platforms = platforms.all;
 # };
}


