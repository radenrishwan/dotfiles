{ pkgs }:

with pkgs.vimPlugins; [
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
]