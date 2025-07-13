{ config, pkgs, ... }:

let
  gemini-cli = pkgs.writeShellScriptBin "gemini" ''
    ${pkgs.bun}/bin/bun x @google/gemini-cli "$@"
  '';
in
{
  programming = [
    pkgs.go
    pkgs.bun
    pkgs.nodejs
    pkgs.rustup
    pkgs.devbox
  ];

  tools = [
    pkgs.neofetch
    pkgs.git
    pkgs.hugo
    pkgs.fzf

    gemini-cli
  ];

  shell = [
    pkgs.zsh
    pkgs.powerline-fonts
    # TODO: install fonts like JetBrains Mono, Fira Code, and Hack later
  ];

  livekit = [
    pkgs.livekit
    (pkgs.stdenv.mkDerivation rec {
      pname = "livekit-cli";
      version = "2.4.11";

      src = pkgs.fetchurl {
        url = "https://github.com/livekit/livekit-cli/releases/download/v${version}/lk_${version}_linux_amd64.tar.gz";
        sha256 = "sha256-0OtdgdVvOnpphTXvNjWOdXLvgnkdpiob9Icjl7MDgTA=";
      };

      sourceRoot = ".";

      installPhase = ''
        mkdir -p $out/bin
        cp lk $out/bin/
        chmod +x $out/bin/lk
        ln -s $out/bin/lk $out/bin/livekit-cli
      '';
    })
  ];

  platformSpecific = if pkgs.stdenv.isDarwin then [
    pkgs.brave
    pkgs.vscode
    pkgs.rectangle
    pkgs.kitty
    pkgs.zed-editor
  ] else [
    pkgs.colima
    pkgs.docker
  ];
}