return {
  -- github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  dependencies = {"creativenull/efmls-configs-nvim"},
  opts = function(_, _)
    require("lspconfig")["efm"].setup({
      init_options = {documentFormatting = true},
      settings = {
        rootMarkers = {".git/"},
        languages = {
          lua = {
            require("efmls-configs.linters.luacheck"),
            require("efmls-configs.formatters.stylua"),
          },
        },
      },
    })
  end,
}
