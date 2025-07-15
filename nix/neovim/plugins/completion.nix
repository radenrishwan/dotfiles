{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = nvim-cmp;
    type = "lua";
    config = ''
      local cmp = require('cmp')
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.filetype_extend("javascriptreact", { "html" })
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      })
    '';
  }

  cmp-nvim-lsp
  cmp-nvim-lua
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp_luasnip
  lspkind-nvim
]