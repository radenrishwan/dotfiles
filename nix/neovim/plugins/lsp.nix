{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = nvim-lspconfig;
    type = "lua";
    config = ''
      local configs = require("lspconfig")
      
      configs.lua_ls.setup({})
      configs.gopls.setup({})
      configs.clangd.setup({})
      configs.rust_analyzer.setup({})
      configs.tsserver.setup({})
      configs.html.setup({})
      configs.jsonls.setup({})
      configs.cssls.setup({})
      configs.eslint.setup({})
      configs.tailwindcss.setup({})
      configs.emmet_ls.setup({})
    '';
  }
]