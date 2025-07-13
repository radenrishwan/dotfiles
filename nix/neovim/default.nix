{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = import ./packages.nix { inherit pkgs; };

    plugins = import ./plugins.nix { inherit pkgs; };

    extraLuaConfig = builtins.readFile ./config.lua;
  };
}