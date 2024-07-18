# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "04pky00rxi7w0b18srg3zaih1l5b12jn30x1314ydqn7v1vlkgbf";
    x86_64-linux = "1ksh2lz4j3b6m12ah5j2a0f15s7n56q96sm1ckgqq1fk30nraijf";
    armv7l-linux = "13rlncxlmpilsbqm0yg6fvws71ics7l2c44wsi8nddcs6fvvfsmm";
    aarch64-linux = "095jv6k7jgar5p5jxsbvhd6d9fknga19gc8majfxa4z9zk894x3p";
    x86_64-darwin = "07dxjscnp4iiny65hi7xgjdafaqivzl7flcsm53f0azdkhachf3a";
    aarch64-darwin = "1j0yjpgd688b8z2xqcnr757y2ym8hlmqi07j0s90bbaa3k2ysiar";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.225.0/cxcli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "cxcli";
  version = "1.225.0";
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
