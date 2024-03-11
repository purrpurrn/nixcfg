{ lib
, stdenvNoCC
, fetchFromGitHub
, inputs
, withXCursor ? false
, withHyprcursor ? true, xcur2png, clickgen, attrs
}:

stdenvNoCC.mkDerivation rec {
  pname = "bibata-cursors";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "ful1e5";
    repo = "Bibata_Cursor";
    rev = "v${version}";
    sha256 = "zCk7qgPeae0BfzhxxU2Dk1SOWJQOxiWyJuzH/ri+Gq4=";
  };

  buildInputs = [ clickgen attrs xcur2png inputs.hyprcursor.packages."x86_64-linux".hyprcursor ];

  buildPhase = lib.strings.optionalString withHyprcursor ''
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Amber' -n 'Bibata-Modern-Amber' -c 'Yellowish and rounded edge bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Classic' -n 'Bibata-Modern-Classic' -c 'Black and rounded edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Ice' -n 'Bibata-Modern-Ice' -c 'White and rounded edge Bibata cursors.'

    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Amber' -n 'Bibata-Original-Amber' -c 'Yellowish and sharp edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Classic' -n 'Bibata-Original-Classic' -c 'Black and sharp edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Ice' -n 'Bibata-Original-Ice' -c 'White and sharp edge Bibata cursors.'

    hyprcursor-util -x themes/Bibata-Modern-Amber -o themes/
    hyprcursor-util -x themes/Bibata-Modern-Classic -o themes/
    hyprcursor-util -x themes/Bibata-Modern-Ice -o themes/
    hyprcursor-util -x themes/Bibata-Original-Amber -o themes/
    hyprcursor-util -x themes/Bibata-Original-Classic -o themes/
    hyprcursor-util -x themes/Bibata-Original-Ice -o themes/
  '' + lib.strings.optionalString withXCursor ''
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Amber' -n 'Bibata-Modern-Amber' -c 'Yellowish and rounded edge bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Classic' -n 'Bibata-Modern-Classic' -c 'Black and rounded edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Modern-Ice' -n 'Bibata-Modern-Ice' -c 'White and rounded edge Bibata cursors.'

    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Amber' -n 'Bibata-Original-Amber' -c 'Yellowish and sharp edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Classic' -n 'Bibata-Original-Classic' -c 'Black and sharp edge Bibata cursors.'
    ctgen build.toml -p x11 -d 'bitmaps/Bibata-Original-Ice' -n 'Bibata-Original-Ice' -c 'White and sharp edge Bibata cursors.'
  '';

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -rf themes/* $out/share/icons/
  '';

  meta = with lib; {
    description = "Material Based Cursor Theme";
    homepage = "https://github.com/ful1e5/Bibata_Cursor";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ rawkode AdsonCicilioti ];
  };
}
