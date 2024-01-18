{ stdenv
, lib
, fetchFromGitHub
, bash
, makeWrapper
}:
  stdenv.mkDerivation {
    pname = "pomo";
    version = "2023-03-15";
    src = fetchFromGitHub {
      repo = "pomo";
      owner = "jsspencer";
      rev = "5a1e3f9c2291bb1ce3bdd6c18ecc1a063b0f6655";
      sha256 = "sha256-O6YBfXwfcMd2niNd0laPt060ub5j/hqcMft4KWKaYTk=";
    };

    buildInputs = [ bash ];
    nativeBuildInputs = [ makeWrapper ];
    installPhase = ''
      mkdir -p $out/bin
      cp pomo.sh $out/bin/pomo.sh
    '';
  }
