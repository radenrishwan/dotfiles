{ config, pkgs, ... }:

let 
  packages = import ./packages.nix { inherit config pkgs; };
in
{
  home.username = "raden";
  home.homeDirectory = "/home/raden";

  home.stateVersion = "25.05";

  home.packages = packages.programming
                ++ packages.tools 
                ++ packages.shell 
                ++ packages.livekit 
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

 
}
