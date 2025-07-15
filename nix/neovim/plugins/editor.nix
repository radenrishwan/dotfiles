{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = nvim-treesitter.withAllGrammars;
    type = "lua";
    config = ''
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    '';
  }

  nvim-ts-autotag

  {
    plugin = hlchunk-nvim;
    type = "lua";
    config = ''
      require("hlchunk").setup({
        chunk = {
          enable = true,
          use_treesitter = true,
          error_sign = true,
          duration = 0,
          delay = 0,
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = ">",
          },
          style = { "#136f63" },
        },
        indent = {
          enable = true,
          use_treesitter = true,
          chars = { "│" },
          style = { "#06231f", "#09342f", "#0C453F", "#0f5750" },
        },
        line_num = { enable = false },
        blank = { enable = false },
      })
    '';
  }

  {
    plugin = rainbow-delimiters-nvim;
    type = "lua";
    config = ''
      local rainbow_delimiters = require 'rainbow-delimiters'
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    '';
  }

  {
    plugin = nvim-ufo;
    type = "lua";
    config = ''
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      require('ufo').setup()
    '';
  }

  promise-async
]