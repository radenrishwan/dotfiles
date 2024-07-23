local map = vim.keymap.set

-- screenkey
map('n', '<leader>ss', ':Screenkey<CR>', { desc = "start screenkey" })

-- barbar
local barbaropts = { noremap = true, silent = true }

map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', barbaropts)
map('n', '<C-l>', '<Cmd>BufferNext<CR>', barbaropts)
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', barbaropts)
map('n', '<leader>bw', ':qa<CR>', barbaropts)

-- conform
local conform = require("conform")

map({ "n", "v" }, "<leader>cp", function()
  conform.format({
    lsp_fallback = true,
    timeout_ms = 500,
  }, { desc = "format" })
end)

-- lspconfig
map('n', 'K', vim.lsp.buf.hover, {})
map('n', 'gd', vim.lsp.buf.definition, {})
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

-- neotree
map("n", "<C-b>", ":Neotree<CR>", { desc = "toggle neotree" })
