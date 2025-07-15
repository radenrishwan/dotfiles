vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")

vim.opt.relativenumber = false
vim.opt.number = true

vim.g.mapleader = " "

-- clipboard settings
if vim.fn.has("macunix") == 1 then
  vim.g.clipboard = {
    name = "macOS-clipboard",
    copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
    paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
    cache_enabled = 0,
  }
elseif vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = { ["+"] = "clip.exe", ["*"] = "clip.exe" },
    paste = { ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))", ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('`r', ''))" },
    cache_enabled = 0,
  }
else
  vim.g.clipboard = {
    name = "linux-clipboard",
    copy = { ["+"] = "xclip -selection clipboard", ["*"] = "xclip -selection primary" },
    paste = { ["+"] = "xclip -selection clipboard -o", ["*"] = "xclip -selection primary -o" },
    cache_enabled = 0,
  }
end

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local map = vim.keymap.set

map('n', '<C-s>', ':w<CR>', { noremap = true, silent = true, desc = "save file" })

map('n', '<leader>ess', ':split<CR>', { desc = "horizontal split" })
map('n', '<leader>esv', ':vsplit<CR>', { desc = "vertical split" })
map('n', '<leader>esc', ':close<CR>', { desc = "close split", noremap = true, silent = true })

map('n', '<C-j>', '<C-W>j', { desc = "move to split below" })
map('n', '<C-k>', '<C-W>k', { desc = "move to split above" })
map('n', '<C-h>', '<C-W>h', { desc = "move to split left" })
map('n', '<C-l>', '<C-W>l', { desc = "move to split right" })

map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true, desc = "go to previous buffer" })
map('n', '<C-l>', '<Cmd>BufferNext<CR>', { noremap = true, silent = true, desc = "go to next buffer" })
map('n', '<leader>bc', '<Cmd>BufferClose<CR>', { noremap = true, silent = true, desc = "close buffer" })
map('n', '<leader>bw', ':qa<CR>', { noremap = true, silent = true, desc = "close all buffers or exit nvim" })

map({ "n", "v" }, "<leader>cp", function()
  require("conform").format({
    lsp_fallback = true,
    timeout_ms = 500,
  })
end, { desc = "format file" })

map('n', 'K', vim.lsp.buf.hover, {})
map('n', 'gd', vim.lsp.buf.definition, {})
map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "open code action" })

map("n", "<C-b>", ":Neotree<CR>", { desc = "toggle neotree" })

local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = "find files on current folder" })
map('n', '<leader>fg', builtin.live_grep, { desc = "live grep on current folder" })
map('n', '<leader>fb', builtin.buffers, { desc = "list buffers" })
map('n', '<leader>fh', builtin.help_tags, { desc = "see help preview" })

-- local ufo = require('ufo')
-- map('n', 'cO', ufo.openAllFolds, { desc = "open all folds" })
-- map('n', 'cC', ufo.closeAllFolds, { desc = "close all folds" })

map('n', '<leader>tt', ':ToggleTerm<CR>', { desc = "toggle bottom terminal" })
map('n', '<leader>tr', ':ToggleTerm direction=vertical size=80<CR>', { desc = "toggle right terminal" })
map('n', '<C-`>', ':ToggleTerm<CR>', { desc = "toggle bottom terminal" })
map('t', '<C-`>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "open diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "open diagnostics for current buffer" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "open symbols" })
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "show LSP references" })