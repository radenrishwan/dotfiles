return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("snippets.go")
      require("snippets.dart")
      require("snippets.v")

      require("luasnip.loaders.from_vscode").lazy_load()
    end
  },
  {
    "m4xshen/autoclose.nvim",
    config = function()
      require("autoclose").setup({})
    end
  }
}
