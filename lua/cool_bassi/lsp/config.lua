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
  "tsserver", -- github.com/typescript-language-server/typescript-language-server
  "tflint", -- github.com/terraform-linters/tflint
  "yamlls", -- github.com/redhat-developer/yaml-language-server
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("cool_bassi.lsp.settings").on_attach,
    capabilities = require("cool_bassi.lsp.settings").capabilities,
  }

  if server == "golangci_lint_ls" then
    local root_dir = lspconfig.util.root_pattern("go.mod", ".golangci.yaml", ".git")

    configs.golangcilsp = {
      default_config = {
        cmd = {
          "golangci-lint-langserver"
        },
        root_dir = root_dir,
        init_options = {
          cmd = { 'golangci-lint-langserver' },
          root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
          init_options = {
            command = function()
              local path = root_dir .. ".golangci.yml"
              local file = io.open(path, "r")

              if file then
                io.close(file)

                return {
                  "golangci-lint",
                  "run",
                  "--out-format",
                  "json",
                  "--issues-exit-code=1",
                }
              else
                return {
                  "golangci-lint",
                  "run",
                  "--enable-all",
                  "--disable",
                  "lll",
                  "--out-format",
                  "json",
                  "--issues-exit-code=1",
                }
              end
            end,
          },
        },
      },
    }
    local golangci_lint_ls = require("cool_bassi.lsp.golangci_lint_ls")
    opts = vim.tbl_deep_extend("force", golangci_lint_ls, opts)
  else
    local has_custom_opts, server_opts = pcall(require, "cool_bassi.lsp." .. server)

    if has_custom_opts then
      opts = vim.tbl_deep_extend("force", opts, server_opts)
    end
  end

  lspconfig[server].setup(opts)
end
