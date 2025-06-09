return {
  -- github.com/nvimtools/none-ls.nvim
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function()
    local nls = require("null-ls")
    return {
      debug = false,
      on_attach = function(client, buffer)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("NLSFormatting", {})

          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = buffer,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "format on save",
            group = augroup,
            buffer = buffer,
            callback = function()
              vim.lsp.buf.format({ bufnr = buffer })
            end,
          })
        end
      end,
      sources = {
        -- github.com/fatih/gomodifytags
        nls.builtins.code_actions.gomodifytags,

        -- github.com/josharian/impl
        nls.builtins.code_actions.impl,

        -- github.com/streetsidesoftware/cspell
        -- code_actions.cspell,

        -- github.com/rhysd/actionlint
        nls.builtins.diagnostics.actionlint,

        -- github.com/codespell-project/codespell
        nls.builtins.diagnostics.codespell,

        -- github.com/nvimtools/none-ls.nvim
        nls.builtins.diagnostics.hadolint,

        -- github.com/protofire/solhint
        -- nls.builtins.diagnostics.solhint,

        -- formatting.black.with({ extra_args = { "--fast" } }),

        -- github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#forge_fmt
        -- nls.builtins.formatting.forge_fmt.with({
        --   extra_args = { "--include-path 'foundry.toml'" },
        --   -- condition = function(utils)
        --   --   return utils.root_has_file({ "./contracts/foundry.toml" })
        --   -- end,
        -- }),

        -- https://github.com/mvdan/gofumpt
        nls.builtins.formatting.gofumpt,

        -- pkg.go.dev/golang.org/x/tools/cmd/goimports
        nls.builtins.formatting.goimports,

        -- github.com/JohnnyMorganz/StyLua
        nls.builtins.formatting.stylua.with({
          condition = function(utils)
            return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
          end,
          extra_args = {
            "--config-path",
            vim.fn.stdpath("config") .. ".stylua.toml",
          },
        }),

        -- developer.hashicorp.com/terraform/cli/commands/fmt
        nls.builtins.formatting.terraform_fmt,

        -- github.com/prettier/prettier
        -- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
      },
    }
  end,
}
