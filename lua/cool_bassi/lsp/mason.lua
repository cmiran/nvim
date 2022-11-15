local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

local servers = {
  "golangci_lint_ls", -- github.com/nametake/golangci-lint-langserver & github.com/golangci/golangci-lint
  "gopls", -- github.com/golang/tools/tree/master/gopls
  "jsonls",
  "sqls", -- github.com/lighttiger2505/sqls
  "solargraph", -- github.com/castwide/solargraph
  -- "sorbet", -- github.com/sorbet/sorbet
  "sumneko_lua", -- github.com/sumneko/lua-language-server
  "yamlls", -- github.com/redhat-developer/yaml-language-server
}

mason.setup(settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local configs_status_ok, configs = pcall(require, "lspconfig/configs")
if not configs_status_ok then
  return
end

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
