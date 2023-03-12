-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

local servers = {
	-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#golangci_lint_ls
	"golangci_lint_ls",
	-- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
	"gopls",
	"jsonls",
	"sqls", -- github.com/lighttiger2505/sqls
	-- "solargraph", -- github.com/castwide/solargraph
	-- "sorbet", -- github.com/sorbet/sorbet
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

	local has_custom_opts, server_opts = pcall(require, "cool_bassi.lsp." .. server)

	if server == "golangci_lint_ls" then
		local config_patterns = { ".golangci.yml", ".golangci.yaml", ".golangci.toml", ".golangci.json" }
		local root_dir =
			lspconfig.util.root_pattern("go.mod", ".golangci.yaml", ".git", unpack(config_patterns))
		local commands = { "golangci-lint", "run", "--out-format", "json", "--issues-exit-code=1" }
		-- local extra_commands = { "--enable-all", "--disable", "lll" }

		-- if not Config_file_exists_at_root_pattern(config_patterns) then
		-- 	for _, opt in ipairs(extra_commands) do
		-- 		table.insert(commands, opt)
		-- 	end
		-- end

		configs.golangcilsp = {
			default_config = {
				cmd = { "golangci-lint-langserver" },
				root_dir = root_dir,
				init_options = {
					command = commands,
				},
			},
		}
	end

	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_opts)
	end

	lspconfig[server].setup(opts)
end
