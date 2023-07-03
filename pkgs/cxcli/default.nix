{ stdenv }:

stdenv.mkDerivation rec {
  name = "cxcli-${version}";
  version = "1.0";
  src = ./.;
  buildPhase = "echo echo Hello World > example";
  installPhase = "install -Dm755 example $out";
}
