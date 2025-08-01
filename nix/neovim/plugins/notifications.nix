{ pkgs }:

with pkgs.vimPlugins; [
  {
    plugin = nvim-notify;
    type = "lua";
    config = ''
      require("notify").setup({
        background_colour = "#000000",
      })
    '';
  }

  {
    plugin = noice-nvim;
    type = "lua";
    config = ''
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
      })
    '';
  }
]