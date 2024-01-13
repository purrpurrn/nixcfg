{ fetchFromGitHub
, python3
, buildLua
, lib
, unstableGitUpdate
}:

buildLua {
  pname = "evafast";
  version = "2022-10-11";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "evafast";
    rev = "f9ee7e41dedf0f65186900e0ccdd6ca6a8ced7ed";
    hash = lib.fakeSha256;
  };
  passthru.updateScript = unstableGitUpdater {};

  dontBuild = false;

#  installPhase = ''
#    runHook preInstall
#
#    mkdir -p $out/share/mpv/scripts
#    cp -r evafast.lua $out/share/mpv/scripts/evafast.lua
#  '';
#
  #passthru.scriptName = "evafast.lua";

  meta = with lib; {
    description = "Fast-forwarding and seeking on a single key, with quality of life features like a slight slowdown when subtitles are shown.":
    homepage = "https://github.com/po5/evafast";
    license = licenses.unfree
    platforms = platforms.all;
  };
};


