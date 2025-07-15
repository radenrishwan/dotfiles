{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = onedark-nvim;
    type = "lua";
    config = ''
      require('onedark').setup {
        style = 'darker',
        transparent = true,
      }
      require('onedark').load()
    '';
  }
]