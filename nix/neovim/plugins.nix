{ pkgs }:

with pkgs.vimPlugins; [
  # Plugin manager (not needed with Nix, but some plugins might expect it)
  lazy-nvim

  # Core dependencies
  plenary-nvim
  nui-nvim
  nvim-web-devicons

  # UI
  {
    plugin = neo-tree-nvim;
    type = "lua";
    config = ''
      require("neo-tree").setup({
        git_status = {
          symbols = {
            added     = "+",
            modified  = "-",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "U",
            staged    = "",
            conflict  = "",
          }
        }
      })
    '';
  }

  {
    plugin = lualine-nvim;
    type = "lua";
    config = ''
      require("lualine").setup({
        options = {
          theme = "onedark",
          section_separators = { "🙂", "🙃" },
          component_separators = { "😒", "🙂" },
        },
      })
    '';
  }

  {
    plugin = barbar-nvim;
    type = "lua";
    config = ''
      vim.g.barbar_auto_setup = false
      require("barbar").setup({
        animation = true,
        insert_at_start = true,
      })
    '';
  }

  # Theme
  {
    plugin = onedark-nvim;
    type = "lua";
    config = ''
      require('onedark').setup {
        style = 'darker',
        transparent = true,
      }
      require('onedark').load()
    '';
  }

  # Notifications
  {
    plugin = nvim-notify;
    type = "lua";
    config = ''
      require("notify").setup({
        background_colour = "#000000",
      })
    '';
  }

  {
    plugin = noice-nvim;
    type = "lua";
    config = ''
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    '';
  }

  # Editor enhancements
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

  # Folding
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
  
  # LSP
  {
    plugin = nvim-lspconfig;
    type = "lua";
    config = ''
      local configs = require("lspconfig")
      
      configs.lua_ls.setup({})
      configs.gopls.setup({})
      configs.clangd.setup({})
      configs.rust_analyzer.setup({})
      configs.tsserver.setup({})
      configs.html.setup({})
      configs.jsonls.setup({})
      configs.cssls.setup({})
      configs.eslint.setup({})
      configs.tailwindcss.setup({})
      configs.emmet_ls.setup({})
    '';
  }

  # Completion
  {
    plugin = nvim-cmp;
    type = "lua";
    config = ''
      local cmp = require('cmp')
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.filetype_extend("javascriptreact", { "html" })
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        }),
        formatting = {
          format = require('lspkind').cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = '...',
          })
        }
      })
    '';
  }

  cmp-nvim-lsp
  cmp-nvim-lua
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp_luasnip
  lspkind-nvim

  # Snippets
  {
    plugin = luasnip;
    type = "lua";
    config = builtins.readFile ./snippets.lua;
  }

  friendly-snippets

  # Formatting
  {
    plugin = conform-nvim;
    type = "lua";
    config = ''
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      })
    '';
  }

  # Git
  {
    plugin = gitsigns-nvim;
    type = "lua";
    config = "require('gitsigns').setup()";
  }

  # Comments
  {
    plugin = nvim-comment;
    type = "lua";
    config = "require('nvim_comment').setup()";
  }

  # Auto pairs
  {
    plugin = autoclose-nvim;
    type = "lua";
    config = "require('autoclose').setup({})";
  }

  # Telescope
  {
    plugin = telescope-nvim;
    type = "lua";
    config = ''
      local telescope = require("telescope")
      local trouble = require("trouble.sources.telescope")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        },
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
          },
        },
      })

      telescope.load_extension("ui-select")
    '';
  }

  telescope-ui-select-nvim

  # Utilities
  {
    plugin = trouble-nvim;
    type = "lua";
    config = "require('trouble').setup({})";
  }

  {
    plugin = todo-comments-nvim;
    type = "lua";
    config = "require('todo-comments').setup({})";
  }

  {
    plugin = which-key-nvim;
    type = "lua";
    config = ''
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({})
    '';
  }

  {
    plugin = toggleterm-nvim;
    type = "lua";
    config = "require('toggleterm').setup({})";
  }

  {
    plugin = auto-session;
    type = "lua";
    config = ''
      require("auto-session").setup({
        suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      })
    '';
  }

  # vibes code
  copilot-vim
  dressing-nvim
  mini-nvim
]