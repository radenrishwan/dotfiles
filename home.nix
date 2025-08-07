{ config, pkgs, ... }:

let
  packages = import ./packages.nix { inherit config pkgs; };
  homeDir = if pkgs.stdenv.isDarwin then "/Users/raden" else "/home/raden";
in
{
  home.username = "raden";
  home.homeDirectory = homeDir;

  home.stateVersion = "25.05";

  home.packages = packages.programming
                ++ packages.tools
                ++ packages.shell
                ++ packages.platformSpecific;

  imports = [
    ./nix/neovim
  ];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "~/.local/bin"
  ];


  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "obraun";
      plugins = [
        "git"
        "golang" "rust" "flutter"
        "docker"
      ];
    };
  };

  programs.zsh.initContent = ''
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  '';
}
