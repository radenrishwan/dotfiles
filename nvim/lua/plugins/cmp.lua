return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          local luasnip = require("luasnip")
          luasnip.filetype_extend("javascriptreact", { "html" })
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          {
            name = "codeium",
            priority = 1000,
            group_index = 1,
          }
        },
        {
          { name = 'buffer' },
        }
      ),
      formatting = {
        format = require('lspkind').cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = '...',
          symbol_map = { Codeium = "", }
        })
      }
    })
  end
}
