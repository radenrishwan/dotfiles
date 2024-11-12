return {
  {
    'stevearc/conform.nvim',
    event = {
      "BufReadPre", "BufNewFile"
    },
    opts = {},
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      })
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          -- web family
          "html",
          "css",
          "tsx",
          -- language
          "go",
          "gosum",
          "gomod",
          "javascript",
          "typescript",
          "rust",
          "lua",
          "c",
          "cpp",
          -- configs file
          "yaml",
          "json",
          "v",
          -- other
          "lua",
          "vim",
          "vimdoc",
          "query"
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  }
}
