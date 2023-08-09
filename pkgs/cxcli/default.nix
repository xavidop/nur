# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    i686-linux = "1n5yvvs92dbf3zfzdxa4k8c7h9iifx9qijbvca755gyk4n94jdcy";
    x86_64-linux = "1g668xjwvdsnx4s2s13x30vwi6vx2nrdzv92mngy8bvr9xwgalyy";
    armv7l-linux = "0cpn0qv4qgc9l4id51k2cp5vnnppp7wmh0rb04mnr791hfigbnw6";
    aarch64-linux = "0s8dh011x1cb78lmpmsvbf5i8kc89sw8c95lz1si24znsfac6lfv";
    x86_64-darwin = "1nf6jl3983cvsvyjbjalx2v53695ka0sj3dzgg16lyrr5xkkrqcg";
    aarch64-darwin = "0714jn0ssxgflqzrrif8gs00z5r7dzaa338m919d639r47m3k9xm";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.89.0/cxcli_Darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "cxcli";
  version = "1.89.0";
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

  meta = with lib; {
    description = "The missing CLI for your Dialogflow CX projects";
    homepage = "https://cxcli.xavidop.me";
    license = licenses.asl20;

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
