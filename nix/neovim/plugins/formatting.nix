{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = conform-nvim;
    type = "lua";
    config = ''
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
        format_on_save = {
          lsp_fallback = true,
          timeout_ms = 500,
        },
      })
    '';
  }
]