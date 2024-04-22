return {
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
    vim.keymap.set({ "n", "v" }, "<leader>cp", function()
      conform.format({
        lsp_fallback = true,
        timeout_ms = 500,
      })
    end)
  end
}
