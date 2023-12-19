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
    i686-linux = "1p81zsyqgicgyz0dkkwb5a4xgdi0fk1264xh576bbxc9s5dji6wh";
    x86_64-linux = "116mkpa9lsbj635c6s0jyyw4dsip7rfnrcif58r9qnwbpdiqvzja";
    armv7l-linux = "0jqcqjx1wwf2cbknbd6gzfrkx2wr9bdj1m3w8jq2018dg08a68sf";
    aarch64-linux = "0kl0mmkcgqc3np7vdkashx5jpj77353nks746vxbpqi3v9j835qv";
    x86_64-darwin = "1rk76a0ms59a0ddgmmh033q42rq2z9pnhj9m1aqq8lvjzqwarah7";
    aarch64-darwin = "0159ssjav88hmlnv4ksj401h6zx7vcbgfww63m8bijmibrjr9jzf";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.140.0/cxcli_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "cxcli";
  version = "1.140.0";
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
