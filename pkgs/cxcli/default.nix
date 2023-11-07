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
    i686-linux = "02fik0dz41v8ckwf4v4p5aqx65dspzbhzwplnrrf9pzlban39bjy";
    x86_64-linux = "1fpm0jcfjkzgflfdn7zhv3ai9gpam39yikj2ywyrdp44k6d1jjrj";
    armv7l-linux = "1g0505rjfl6zk7r1sr6lvm3pnj3jn92zggniq3s9b29vyvllr4ij";
    aarch64-linux = "07rpnsxzcv1b8xdfb97ii5hzc7ypqp9rz2k9ihf1g9pr28dzxnc6";
    x86_64-darwin = "1rlcy2cmdv1mfjwq6l0gz41ky9ks9vh1nddb4vwwf5iy5vdj7hll";
    aarch64-darwin = "0nn11m7r7sscx96nmx4ffdvyxy4jm2lw0q1h336gr5k4phjai8j8";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.128.0/cxcli_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "cxcli";
  version = "1.128.0";
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
