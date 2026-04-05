---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = { "lua/?.lua", "lua/?/init.lua" },
      },
      diagnostics = {
        globals = { "vim", "Snacks" },
      },
      completion = {
        callSnippet = "Both",
        displayContext = 1,
        keywordSnippet = "Both",
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
        library = vim.list_extend(
          {
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library",
            "${3rd}/busted/library",
          },
          vim.fn.glob(vim.fn.stdpath("data") .. "/lazy/*/lua", true, true)
        ),
        checkThirdParty = false,
      },
    },
  },
}
