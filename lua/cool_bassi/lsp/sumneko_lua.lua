-- github.com/sumneko/lua-language-server/wiki/Settings
return {
	settings = {
		Lua = {
      completion = {
        callSnippet = "Both",
        displayContext = 1,
        keywordSnippet = "Both",
      },
			diagnostics = {
				globals = {
          'vim',
        },
			},
      format = {
        enable = false,
      },
      hint = {
        arrayIndex = "Disable",
        enable = true,
        paramName = "Disable",
        paramType = false,
        semicolon = "Disable",
        setType = true,
      },
      runtime = {
        version = "LuaJIT",
        -- special = {
        --   reload = "require",
        -- },
      },
      telemetry = {
        enable = false,
      },
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
          vim.api.nvim_get_runtime_file('', true),
				},
			},
		},
	},
}
