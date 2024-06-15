return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  },
  setup = function()
    local wk = require("which-key")

    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = true,
    }

    local map = {
      ["f"] = { "<cmd>Telescope find_files<cr>", "Find File" },
      ["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    }

    wk.setup()
    wk.register(map, opts)
  end
}
