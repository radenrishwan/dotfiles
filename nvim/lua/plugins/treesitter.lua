return {
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
        "json"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end
}
