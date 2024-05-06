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
    i686-linux = "02k256vjabvrf34p8746by09i8sqp5kkb0pmf6as1mx4bqppnc1y";
    x86_64-linux = "1zdf08r1fc770fvg5dr99bvd24j6b1810p4c78ravijqm97vkary";
    armv7l-linux = "1gqh7pn2kg27p17mpmssgbbp6b2psl6z9zmxjhik5hlhryv6f7lg";
    aarch64-linux = "0lsyn6d0lzp2f1pcwg16zshkpalndr0iaklhc03nq2fb67w3iis3";
    x86_64-darwin = "0dijscvcn7l8i14l5bgg8m7mz6qjip3di88pksiwa3r8rylm4yy8";
    aarch64-darwin = "1c6ij4mpmjmzhabnhdx28jk4cdqb04kb99mv1q1pyrbwi2brmnlc";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/dialogflow-cx-cli/releases/download/v1.203.0/cxcli_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "cxcli";
  version = "1.203.0";
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
