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
    i686-linux = "096i8zlnxfd9m36qs7ff9bkpsywzpqk4ry3940dkb00gk0p11v5d";
    x86_64-linux = "17d813cml7z1qjdwvka3pbcnp04wxwcij0f43na9dzkcbfvdz06d";
    armv7l-linux = "1bj3a80jnl3ax6x2pr12acx23ld0f5j1acxx7cb94frig1jgjxwp";
    aarch64-linux = "0ywa0nxz2jarq15yskcn49ildawfgv4407wbd6z76jl6nmirafgz";
    x86_64-darwin = "1wns4qshl589bsfqab69idm1zx6vv96p9zmhjr87j6y24m3na7r5";
    aarch64-darwin = "1dvnax2jamalav56kpmczhwcpqxbvdxsrwjwda2yabqirrk5vx67";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.223.0/cxcli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "cxcli";
  version = "1.223.0";
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
