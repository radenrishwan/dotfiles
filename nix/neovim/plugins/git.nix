{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = gitsigns-nvim;
    type = "lua";
    config = "require('gitsigns').setup()";
  }
]