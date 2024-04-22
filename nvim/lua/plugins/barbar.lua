return {
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

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map('n', '<C-h>', '<Cmd>BufferPrevious<CR>', opts)
    map('n', '<C-l>', '<Cmd>BufferNext<CR>', opts)
    map('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)
    map('n', '<leader>bw', ':qa<CR>', opts)
  end
}
