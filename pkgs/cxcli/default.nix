# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    i686-linux = "1j051k0zx9l5iyn95l6z6jfncbs6kqfwliyv0nxa7v7sjqy0g95c";
    x86_64-linux = "0qi6dvr3gi2wbj07af094ivar20ikmh1zam1giskr11c4p0j51b2";
    armv7l-linux = "1idpwxi7ydgm26m6iw5zlllap7npksysfr3qsc0acysjiil22zyc";
    aarch64-linux = "081z8ilsgg4w2qgmpldjbgimr4xyrj7asx5qqdvfls6pas5r17yy";
    x86_64-darwin = "1bgf0km30dnss3y1q70fng3afjarmp2y69qv9q7kvdgv1m0b09kp";
    aarch64-darwin = "0x6jzmxfb76n5b9d5vpsyq3s77gf5nkgdpqblhajxcsxcaxrsswr";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.141.0/cxcli_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "cxcli";
  version = "1.141.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./cxcli $out/bin/cxcli
    installManPage ./manpages/cxcli.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "The missing CLI for your Dialogflow CX projects";
    homepage = "https://cxcli.xavidop.me";
    license = lib.licenses.asl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
