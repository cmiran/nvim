return {
  -- github.com/L3MON4D3/LuaSnip/
  "L3MON4D3/LuaSnip",
  dependencies = {
    -- github.com/rafamadriz/friendly-snippets
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  config = true,
}
