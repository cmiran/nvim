-- github.com/jose-elias-alvarez/null-ls.nvim
local null_ls = require("null-ls")

-- github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
local code_actions = null_ls.builtins.code_actions

-- github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#completion
local completion = null_ls.builtins.completion

-- github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#hover
local hover = null_ls.builtins.hover

-- github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#formatting
local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- github.com/streetsidesoftware/cspell
		-- code_actions.cspell,

		-- github.com/L3MON4D3/LuaSnip
		completion.luasnip,

		-- github.com/rhysd/actionlint
		diagnostics.actionlint,

		-- github.com/get-alex/alex
		-- diagnostics.alex,

		-- github.com/mrtazz/checkmake
		-- diagnostics.checkmake,

		-- github.com/streetsidesoftware/cspell
		-- diagnostics.cspell,

		-- github.com/codespell-project/codespell
		diagnostics.codespell,

		-- github.com/PyCQA/flake8
		-- diagnostics.flake8,

		-- github.com/protofire/solhint
		diagnostics.solhint,

		-- github.com/testdouble/standard
		-- diagnostics.standardrb,

		-- formatting.black.with({ extra_args = { "--fast" } }),

		-- github.com/stedolan/jq
		formatting.jq,

		-- github.com/testdouble/standard
		-- formatting.standardrb,

    -- github.com/JohnnyMorganz/StyLua
    formatting.stylua.with({
      condition = function(utils)
        return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
      end,
    }),

		-- github.com/prettier/prettier
		-- formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
	},
})
