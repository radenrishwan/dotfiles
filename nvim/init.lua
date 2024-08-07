vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed")

vim.opt.relativenumber = false
vim.opt.number = true

-- need to configure for ufo
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- remap key
vim.g.mapleader = " "
vim.g.clipboard = {
  name = "macOS-clipboard",
  copy = { ["+"] = "pbcopy", ["*"] = "pbcopy" },
  paste = { ["+"] = "pbpaste", ["*"] = "pbpaste" },
  cache_enabled = 0,
}

-- disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

-- common keymaps
vim.keymap.set('n', '<C-s>', ":w<CR>", {})


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins", opts)

-- keymaps
require("keymaps.keymaps")
