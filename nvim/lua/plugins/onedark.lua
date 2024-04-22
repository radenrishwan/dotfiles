return {
  "radenrishwan/onedark.nvim",
  name = "onedark",
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'darker',
      transparent = false,
    }

    require('onedark').load()
  end
}
