{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = luasnip;
    type = "lua";
    config = builtins.readFile ../snippets.lua;
  }

  friendly-snippets
]