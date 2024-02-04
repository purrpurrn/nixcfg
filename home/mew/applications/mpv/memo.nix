{ fetchFromGitHub
, stdenv
, lib
}:

stdenv.mkDerivation {
  pname = "memo";
  version = "2023-10-31";

  src = fetchFromGitHub {
    owner = "po5";
    repo = "memo";
    rev = "6f2b036ef860e130ea584657389e0a7ceb4d954f";
    sha256 = "03rk1f97jblnajgwr36qz7hq1qlxrgkywc0gnq0wwg1vxiga9j4v";
  };

  installPhase = ''
    mkdir -p $out/share/mpv/scripts
    cp -r memo.lua $out/share/mpv/scripts
  '';

  dontBuild = true;

  passthru.scriptName = "memo.lua";

  meta = with lib; {
    description = "A recent files menu for mpv.";
    homepage = "https://github.com/po5/memo";
    license = licenses.gpl3;
    #maintainers = with lib.maintainers; [ purrpurrn ];
  };
}


