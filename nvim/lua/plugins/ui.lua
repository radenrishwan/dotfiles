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
            added     = "+", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "-", -- or "", but this is redundant info if you use git_status_colors on the name
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          section_separators = { "🙂", "🙃" },
          component_separators = { "😒", "🙂" },
        },
      })
    end
  },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    event = "VeryLazy",
    opts = {
      cmdline = {
      },
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end
  },
  {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup({
      })
    end
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
        transparent = true,
      }

      require("notify").setup({
        background_colour = "#000000",
      })

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

      wk.setup()
      wk.register({}, opts)
    end
  },
  {
    'echasnovski/mini.nvim',
    version = false,
    setup = function()
      require("mini.map").setup({
        symbols = {
          encode = nil,
          scroll_line = '█',
          scroll_view = '┃',
        },
      })
    end
  },
  { 'akinsho/toggleterm.nvim', version = "*", config = true }
}
