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
    i686-linux = "1g9diw0l4hmhz7qrmycm6q5r86qbm6wvkgyxksb930d1d74cz4p8";
    x86_64-linux = "0257fxbz42hy7gsjkcl5p5afldnmghp8v1lbqlpb49dd93rvsn51";
    armv7l-linux = "0ngb2f1l9qspa15bhj6an7d4s6fyhbmnvh3zfipmg26hm3flvrf7";
    aarch64-linux = "0g0pxl8xc98l2cswlsrr5p04w97k90w2d33dv1cp4m7s0pp5zihk";
    x86_64-darwin = "1343j2042l3l3jpspdrlrj6c3ijbvg6p2gl6p2z91bfl0wiwl4qc";
    aarch64-darwin = "1vkxwjh11r8x0bkndjc6mfhhqrkclcc56607lpaz22gmrf9frj89";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.18.0/voiceflow_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "voiceflow";
  version = "1.18.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./voiceflow $out/bin/voiceflow
    installManPage ./manpages/voiceflow.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "The CLI for your Voiceflow projects";
    homepage = "https://voiceflow.xavidop.me";
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
