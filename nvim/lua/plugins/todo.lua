-- TODO: need to configure later
return {
  -- {
  --   'nvim-pack/nvim-spectre',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   setup = function()
  --     local spectre = require('spectre')
  --
  --     spectre.setup()
  --
  --     vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
  --       desc = "Toggle Spectre"
  --     })
  --     vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  --       desc = "Search current word"
  --     })
  --     vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  --       desc = "Search current word"
  --     })
  --     vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  --     })
  --   end
  --
  -- }, am i really need ???
  -- {
  --   "olimorris/persisted.nvim",
  --   lazy = false, -- make sure the plugin is always loaded at startup
  --   config = function()
  --     require("persisted").setup({
  --       autoload = true,
  --       on_autoload_no_session = function()
  --         vim.notify("No existing session to load.")
  --       end,
  --       log_level = "ERROR",                                              -- One of "TRACE", "DEBUG", "ERROR"
  --       save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
  --       silent = false,                                                   -- silent nvim message when sourcing session file
  --       use_git_branch = false,                                           -- create session files based on the branch of a git enabled repository
  --       default_branch = "main",                                          -- the branch to load if a session file is not found for the current branch
  --       autosave = true,                                                  -- automatically save session files when exiting Neovim
  --       should_autosave = nil,                                            -- function to determine if a session should be autosaved
  --       follow_cwd = true,                                                -- change session file name to match current working directory if it changes
  --       allowed_dirs = nil,                                               -- table of dirs that the plugin will auto-save and auto-load from
  --       ignored_dirs = nil,                                               -- table of dirs that are ignored when auto-saving and auto-loading
  --       ignored_branches = nil,                                           -- table of branch patterns that are ignored for auto-saving and auto-loading
  --       telescope = {
  --         reset_prompt = true,                                            -- Reset the Telescope prompt after an action?
  --         mappings = {                                                    -- table of mappings for the Telescope extension
  --           change_branch = "<c-b>",
  --           copy_session = "<c-c>",
  --           delete_session = "<c-d>",
  --         },
  --         icons = { -- icons displayed in the picker, set to nil to disable entirely
  --           branch = " ",
  --           dir = " ",
  --           selected = " ",
  --         },
  --       },
  --       -- ignored_dirs = {
  --       --   "~/Downloads",
  --       --   "~/",
  --       --   "/",
  --       -- },
  --     })
  --     require("telescope").load_extension("persisted")
  --   end
  -- },
}
