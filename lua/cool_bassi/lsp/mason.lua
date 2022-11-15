local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
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
  "golangci_lint_ls", -- github.com/golangci/golangci-lint
  "jsonls",
  "sqls", -- github.com/lighttiger2505/sqls
  "solargraph", -- github.com/castwide/solargraph
  -- "sorbet", -- github.com/sorbet/sorbet
  "sumneko_lua", -- github.com/sumneko/lua-language-server
  "yamlls", -- github.com/redhat-developer/yaml-language-server
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("cool_bassi.lsp.handlers").on_attach,
		capabilities = require("cool_bassi.lsp.handlers").capabilities,
	}

  if server == "golangci_lint_ls" then
    local golangci_lint_ls = require("cool_bassi.lsp.settings.golangci_lint_ls")
    opts = vim.tbl_deep_extend("force", golangci_lint_ls, opts)

    -- github.com/nametake/golangci-lint-langserver#configuration-for-nvim-lspconfig
    -- local configs = require('lspconfig/configs')
    -- if not configs.golangcilsp then
    --   configs.golangcilsp = {
    --     default_config = {
    --       cmd = {
    --         'golangci-lint-langserver'
    --       },
    --       root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
    --       init_options = {
    --         command = {
    --           "golangci-lint",
    --           "run",
    --           "--enable-all",
    --           "--disable",
    --           "lll",
    --           "--out-format",
    --           "json",
    --           "--issues-exit-code=1",
    --         },
    --       },
    --     },
    --   }
    -- end
  end

  if server == "jsonls" then
    local jsonls_opts = require "cool_bassi.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server == "sqls" then
    local sqls_opts = require "cool_bassi.lsp.settings.sqls"
    opts = vim.tbl_deep_extend("force", sqls_opts, opts)
  end

  if server == "solargraph" then
    local solargraph_opts = require "cool_bassi.lsp.settings.solargraph"
    opts = vim.tbl_deep_extend("force", solargraph_opts, opts)
  end

  if server == "sumneko_lua" then
    local sumneko_opts = require "cool_bassi.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "yamlls" then
    local yamlls_opts = require "cool_bassi.lsp.settings.yamlls"
    opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
  end

	lspconfig[server].setup(opts)
end
