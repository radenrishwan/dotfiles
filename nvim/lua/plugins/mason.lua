return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local ei = {
        "lua_ls",
        "gopls",
        "golangci_lint_ls",
        "rust_analyzer",
        "tsserver",
        "htmx",
        "jsonls",
        "eslint",
        "cssls",
        "html",
        "tailwindcss",
        "emmet_ls"
      }

      require("mason-lspconfig").setup({
        ensure_installed = ei
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local configs = require("lspconfig")
      configs.lua_ls.setup({})
      configs.gopls.setup({})
      configs.golangci_lint_ls.setup({})
      configs.rust_analyzer.setup({})
      configs.tsserver.setup({})
      configs.html.setup({})
      configs.htmx.setup({})
      configs.cssls.setup({})
      configs.eslint.setup({})
      configs.htmx.setup({})
      configs.tailwindcss.setup({})
      configs.emmet_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  },
}
