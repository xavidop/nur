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
    i686-linux = "0qy473sz7qb18h3w1bz849r33rh5akchc4mwnjcymc8ahky7jqbm";
    x86_64-linux = "076qn0zz0hxhpmvyn6975cybkh1gqprkhhs2q11n2j4wyg6fifwp";
    armv7l-linux = "1hz10qaakcqrca2yzj1r0gi897z3pi6hy07w9l72cq45y5hjcscp";
    aarch64-linux = "05rdb66n2lcjaslw09ag0xcp86b1qn1ch5kp4l0gq075ag75apli";
    x86_64-darwin = "1yq1qdrkz4y0x3jly6gakfiipla7ccsbc0zspqy5a59mgqjbmnq5";
    aarch64-darwin = "1w129yl4ixyb3r8aqk93smxmp6b4f502w71ilqasrmpv7sqn3lsz";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.134.0/cxcli_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "cxcli";
  version = "1.134.0";
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
