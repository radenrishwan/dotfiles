{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = nvim-comment;
    type = "lua";
    config = "require('nvim_comment').setup()";
  }

  {
    plugin = autoclose-nvim;
    type = "lua";
    config = "require('autoclose').setup({})";
  }

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

  dressing-nvim
  mini-nvim

  copilot-vim
  {
    plugin = pkgs.vimPlugins.avante-nvim;
    type = "lua";
    config = ''
      require("avante_lib").load()
      require("avante").setup({
        provider = "gemini",
        gemini = {
          model = "gemini-2.5-pro",  
        }
      })
    '';
  }
]