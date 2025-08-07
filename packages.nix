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
    pkgs.docker

    gemini-cli
  ];

  shell = [
    pkgs.zsh
    pkgs.powerline-fonts
    # TODO: install fonts like JetBrains Mono, Fira Code, and Hack later
  ];

  platformSpecific = if pkgs.stdenv.isDarwin then [
    pkgs.brave
    pkgs.rectangle
    pkgs.kitty

    pkgs.colima

    pkgs.vscode
    pkgs.zed-editor
    pkgs.jetbrains.datagrip
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.rider

    pkgs.zoom-us
    pkgs.localsend

    pkgs.telegram-desktop
    pkgs.discord

  ] else [
    pkgs.colima
    pkgs.docker
  ];
}
