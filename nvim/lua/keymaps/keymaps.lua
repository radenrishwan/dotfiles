local map = vim.keymap.set

-- screenkey
map('n', '<leader>ss', ':Screenkey<CR>', { desc = "start screenkey" })

-- barbar
map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = "go to previous buffer" })
map('n', '<C-l>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = "go to next buffer" })
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = "close buffer" })
map('n', '<leader>bw', ':qa<CR>', { noremap = true, silent = true, desc = "close all buffers or exit nvim" })

-- conform
local conform = require("conform")

map({ "n", "v" }, "<leader>cp", function()
  conform.format({
    lsp_fallback = true,
    timeout_ms = 500,
  })
end, { desc = "format file" })

-- lspconfig
map('n', 'K', vim.lsp.buf.hover, {})
map('n', 'gd', vim.lsp.buf.definition, {})
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "open code action" })

-- neotree
map("n", "<C-b>", ":Neotree<CR>", { desc = "toggle neotree" })

-- telescope
local builtin = require('telescope.builtin')

map('n', '<leader>ff', builtin.find_files, { desc = "find files on current folder" })
map('n', '<leader>fg', builtin.live_grep, { desc = "live grep on current folder" })
map('n', '<leader>fb', builtin.buffers, { desc = "list buffers" })
map('n', '<leader>fh', builtin.help_tags, { desc = "see help preview" })

-- ufo
local ufo = require('ufo')
map('n', 'cO', ufo.openAllFolds, { desc = "open all folds" })
map('n', 'cC', ufo.closeAllFolds, { desc = "close all folds" })
map('n', 'co', ufo.openFoldsExceptKinds, { desc = "open all folds except kinds" })
map('n', 'cc', ufo.closeFoldsWith, { desc = "close all folds with kinds" })
