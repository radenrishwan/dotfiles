return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        git_status = {
          symbols = {
            -- Change type
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "✖", -- this can only be used in the git_status source
            renamed   = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored   = "",
            unstaged  = "U",
            staged    = "",
            conflict  = "",
          }
        }
      })
    end
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require('fine-cmdline').setup({
        cmdline = {
          enable_keymaps = true,
          smart_history = true,
          prompt = '> '
        }
      })

      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
    end
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      animation = true,
      insert_at_start = true,
    },
    version = '^1.0.0',
    config = function()
      vim.g.barbar_auto_setup = false
      require("mason").setup()
    end
  },
  {
    "radenrishwan/onedark.nvim",
    name = "onedark",
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
        transparent = false,
      }

      require('onedark').load()
    end
  },
  {
    "NStefan002/screenkey.nvim",
    cmd = "Screenkey",
    lazy = false,
    version = "*",
  },
  {
    -- TODO: need to configure later
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
}
