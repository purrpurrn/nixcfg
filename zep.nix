{ fetchFromGitHub
, fetchNpmDeps
, buildNpmPackage
, lib
, pkgs
}:

buildNpmPackage {
  pname = "Zeppelin";
  version = "0-unstable-2024-02-05";

  src = fetchFromGitHub {
    owner = "ZeppelinBot";
    repo = "Zeppelin";
    rev = "d53f37756d5d4620dcd88e412fb23f6b937a0532";
    hash = "sha256-kuBl3Gk4BW++y9QuQTJVL80n/xqasPrrZu55GWl0uzE=";
  };

  #npmDepsHash = "sha256-jlalO4px9aGLKzvIHnIAnpZBsMB4PCHwTz2vXSSv3X0=";

  npmDeps = fetchNpmDeps {
    src = ./.;
    hash = "sha256-jlalO4px9aGLKzvIHnIAnpZBsMB4PCHwTz2vXSSv3X0=";
  };

  nodejs = pkgs.nodejs_18;

  npmBuildFlags = [ "migrate-prod" "start-api-prod" "start-bot-prod" ];

  NODE_OPTIONS = "--openssl-legacy-provider";

  dontNpmBuild = false;
 
  meta = with lib; {
    description = "A versatile Discord moderation bot, prioritizing large servers and reliability";
    homepage = "https://zeppelin.gg/";
    license = licenses.elastic20;
    maintainers = with lib.maintainers; [ purrpurrn ];
  };
}


