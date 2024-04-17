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
    i686-linux = "1zcrqj2809q6d28ymqh9wj0w313jp14gkz1x79wfpgsi9gwfzcnj";
    x86_64-linux = "15hfc4wh6r0lpaym541janqs910ls4db8s6nxpwhxyg3nkr6hksb";
    armv7l-linux = "001dx6dj2736kkll7vwzxv0q0gqy2c16qjs0x1b9scmm1p3l0ncg";
    aarch64-linux = "00jnx5jx9z4h4z83bigwgic4mvwaql89xx3lg8ncidx3fs3gi39s";
    x86_64-darwin = "0zw210z6dcrpdjwrq2m21lx65y9jawz442srg40m5pnjicwwpj8y";
    aarch64-darwin = "026ybpx6samd1jyda7bj0h86931p0h9xnldsif9nr05ygk6lri23";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.192.0/cxcli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "cxcli";
  version = "1.192.0";
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
