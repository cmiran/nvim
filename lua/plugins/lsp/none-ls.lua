local augroup = vim.api.nvim_create_augroup("NLSFormatting", {})

return {
  -- github.com/nvimtools/none-ls.nvim
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  on_attach = function(client, buffer)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = buffer,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = buffer,
        callback = function()
          vim.lsp.buf.format({ bufnr = buffer })
        end,
      })
    end
  end,
  opts = function()
    local nls = require("null-ls")
    return {
      debug = false,
      sources = {
        -- github.com/fatih/gomodifytags
        nls.builtins.code_actions.gomodifytags,

        -- github.com/josharian/impl
        nls.builtins.code_actions.impl,

        -- github.com/streetsidesoftware/cspell
        -- code_actions.cspell,

        -- github.com/L3MON4D3/LuaSnip
        nls.builtins.completion.luasnip,

        -- github.com/rhysd/actionlint
        nls.builtins.diagnostics.actionlint,

        -- github.com/get-alex/alex
        -- diagnostics.alex,

        -- github.com/mrtazz/checkmake
        -- diagnostics.checkmake,

        -- github.com/streetsidesoftware/cspell
        -- diagnostics.cspell,

        -- github.com/codespell-project/codespell
        nls.builtins.diagnostics.codespell,

        -- github.com/PyCQA/flake8
        -- diagnostics.flake8,

        -- github.com/protofire/solhint
        nls.builtins.diagnostics.solhint,

        -- github.com/testdouble/standard
        -- diagnostics.standardrb,

        -- formatting.black.with({ extra_args = { "--fast" } }),

        -- https://github.com/mvdan/gofumpt
        nls.builtins.formatting.gofumpt,

        -- pkg.go.dev/golang.org/x/tools/cmd/goimports
        nls.builtins.formatting.goimports,

        -- github.com/stedolan/jq
        nls.builtins.formatting.jq,

        -- github.com/testdouble/standard
        -- formatting.standardrb,

        -- github.com/JohnnyMorganz/StyLua
        nls.builtins.formatting.stylua.with({
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
        }),

        -- github.com/prettier/prettier
        -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
      },

    }
  end,
}
