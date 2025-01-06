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
    i686-linux = "1zi39w4garz10kc92yvj6w8j1qv111la7mjnnaps24kr3hrc7kpd";
    x86_64-linux = "0nhzqnx6zw3igsld3zw581wb7y3cz4f6y8h2w6bwv75xh618ync9";
    armv7l-linux = "01fyfsb1qrbwjz6inx90hhy51z92kxmzic1yzqscmjk6zv8x68cc";
    aarch64-linux = "1flsp0qcwvnrmpqmr26vgwsx56lgx6qzfbh40d6yk5dk49q2g66y";
    x86_64-darwin = "1c20dkja1sk2f983si6yx6nk8lwywqzj9mwfnw3adj2ynlmz090m";
    aarch64-darwin = "1szighv6av8dpgvvvmi20h36gcfj75asaqrd03slymm7mrzhklzq";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.1/voiceflow_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "voiceflow";
  version = "1.10.1";
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
