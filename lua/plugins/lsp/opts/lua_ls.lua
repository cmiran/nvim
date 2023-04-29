-- github.com/sumneko/lua-language-server/wiki/Settings
return {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Both",
        displayContext = 1,
        keywordSnippet = "Both",
      },
      format = {
        enable = true,
      },
      hint = {
        enable = true,
        arrayIndex = "Disable",
        paramName = "Disable",
        paramType = false,
        semicolon = "Disable",
        setType = true,
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
