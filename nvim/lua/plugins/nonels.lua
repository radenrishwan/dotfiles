return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- go
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,
        -- null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.goimports_reviser,
        -- js family or web
        -- null_ls.builtins.diagnostics.semgrep,
        -- null_ls.builtins.formatting.biome,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.rustywind,
        -- sh
        -- null_ls.builtins.diagnostics.dotenv_linter,
        -- markdown
        -- null_ls.builtins.diagnostics.markdownlint,
        -- null_ls.builtins.formatting.mdformat,
        -- sql
        -- null_ls.builtins.diagnostics.sqlfluff.with({
        --   extra_args = { "--dialect", "postgres", "mysql" },
        -- }),
        -- null_ls.builtins.formatting.sqlformat,
        -- more
        -- null_ls.builtins.completion.luasnip,
        -- null_ls.builtins.formatting.cbfmt,
        -- null_ls.builtins.diagnostics.spectral,
        -- null_ls.builtins.formatting.cmake_format,
        -- null_ls.builtins.formatting.codespell,
        -- null_ls.builtins.diagnostics.todo_comments
      },
    })
  end
}
