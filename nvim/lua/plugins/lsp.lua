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
        "zls",
        -- "golangci_lint_ls",
        "rust_analyzer",
        "tsserver",
        "htmx",
        "svelte",
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
      configs.dartls.setup({})
      configs.lua_ls.setup({})
      configs.gopls.setup({})
      -- configs.golangci_lint_ls.setup({})
      configs.rust_analyzer.setup({})
      configs.tsserver.setup({})
      configs.html.setup({})
      configs.htmx.setup({})
      configs.jsonls.setup({})
      configs.cssls.setup({})
      configs.eslint.setup({})
      configs.htmx.setup({})
      configs.tailwindcss.setup({})
      configs.emmet_ls.setup({})
      configs.svelte.setup({})
      configs.zls.setup({})
      configs.gleam.setup({})
    end
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- go
          null_ls.builtins.code_actions.gomodifytags,
          null_ls.builtins.code_actions.impl,
          null_ls.builtins.code_actions.refactoring,
          -- null_ls.builtins.diagnostics.golangci_lint,
          null_ls.builtins.formatting.gofmt,
          null_ls.builtins.formatting.goimports,
          null_ls.builtins.formatting.goimports_reviser,
          -- js family or web
          -- null_ls.builtins.diagnostics.semgrep,
          -- null_ls.builtins.formatting.biome,
          -- null_ls.builtins.formatting.prettier,
          -- null_ls.builtins.formatting.rustywind,
          -- sh
          -- null_ls.builtins.diagnostics.dotenv_linter,
          -- markdown
          -- null_ls.builtins.diagnostics.markdownlint,
          -- null_ls.builtins.formatting.mdformat,
          -- sql
          -- null_ls.builtins.diagnostics.sqlfluff.with({
          --   extra_args = { "--dialect", "postgres", "mysql" },
          -- }),
          -- null_ls.builtins.formatting.sqlformat,
          -- more
          -- null_ls.builtins.completion.luasnip,
          -- null_ls.builtins.formatting.cbfmt,
          -- null_ls.builtins.diagnostics.spectral,
          -- null_ls.builtins.formatting.cmake_format,
          -- null_ls.builtins.formatting.codespell,
          -- null_ls.builtins.diagnostics.todo_comments
        },
      })
    end
  },
  {
    'mfussenegger/nvim-lint',
    event = {
      "BufWritePost", "BufReadPost", "InsertLeave"
    },
    config = function()
      require('lint').linters_by_ft = {
        lua = { 'luacheck' },
      }
    end
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  }
}
