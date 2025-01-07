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
    i686-linux = "1a6nbdagxdfg3bv3x1k4pb98a08mng5pi8yfsrwc6hv8533x6lf4";
    x86_64-linux = "1vycazvca9abgnf9rlx1ffk8axx37675wxb0rkkx3hvq04sh76rp";
    armv7l-linux = "15mv8xx71sdbnpkrja7xmsp0i71i358qaiy3jfif1q1hdg8kamqv";
    aarch64-linux = "0fnw80k8abmmk91s2lar94wjpmldpig11gsk84j2p1jml3h69h8d";
    x86_64-darwin = "16cqnah5wb3aw5gw07dxjzj4wwijh920rifdpqr5kpfjdzkyswa4";
    aarch64-darwin = "17kndrhhnhml0x129zbwzph4vj15lc6cb98zhn1vxb4wn6b9z165";
  };

  urlMap = {
    i686-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/xavidop/voiceflow-cli/releases/download/v1.10.3/voiceflow_Darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "voiceflow";
  version = "1.10.3";
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
