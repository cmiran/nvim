-- github.com/sumneko/lua-language-server/wiki/Settings
---@type vim.lsp.Config
---return {
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
      diagnostics = {
        globals = {
          "vim",
          "Snacks",
        },
      },
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
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}
