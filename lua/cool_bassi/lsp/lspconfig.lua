local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

local servers = {
  "golangci_lint_ls", -- github.com/nametake/golangci-lint-langserver & github.com/golangci/golangci-lint
  "gopls", -- github.com/golang/tools/tree/master/gopls
  "jsonls",
  "sqls", -- github.com/lighttiger2505/sqls
  -- "solargraph", -- github.com/castwide/solargraph
  -- "sorbet", -- github.com/sorbet/sorbet
  "sumneko_lua", -- github.com/sumneko/lua-language-server
  "terraformls", -- github.com/hashicorp/terraform-ls
  "yamlls", -- github.com/redhat-developer/yaml-language-server
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("cool_bassi.lsp.handlers").on_attach,
    capabilities = require("cool_bassi.lsp.handlers").capabilities,
  }

  if server == "golangci_lint_ls" then
    configs.golangcilsp = {
      default_config = {
        cmd = {
          "golangci-lint-langserver"
        },
        root_dir = lspconfig.util.root_pattern("go.mod", ".golangci.yaml", ".git"),
        init_options = {
          -- command = function()
          --   if file_exits(root_pattern(".golangci.yml")) then
          --     return {
          --       "golangci-lint",
          --       "run",
          --       "--out-format",
          --       "json",
          --     }
          --   else
          --     return {
          --       "golangci-lint",
          --       "run",
          --       "--enable-all",
          --       "--disable",
          --       "lll",
          --       "--out-format",
          --       "json",
          --       "--issues-exit-code=1"
          --     }
          --   end
          -- end,
          command = {
            "golangci-lint",
            "run",
          },
        },
      },
    }
    local golangci_lint_ls = require("cool_bassi.lsp.settings.golangci_lint_ls")
    opts = vim.tbl_deep_extend("force", golangci_lint_ls, opts)
  else
    local has_custom_opts, server_opts = pcall(require, "user.lsp.settings." .. server)

    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_opts)
    end
  end

  lspconfig[server].setup(opts)
end
