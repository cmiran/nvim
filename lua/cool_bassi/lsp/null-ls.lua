local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- diagnostics.standardrb,
    -- diagnostics.flake8,

    -- formatting.black.with({ extra_args = { "--fast" } }),
    formatting.golangci_lint,
    -- formatting.standardrb,
    formatting.stylua,
    -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
  },
})
