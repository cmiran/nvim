return {
  -- github.com/JoosepAlviste/nvim-ts-context-commentstring
  "JoosepAlviste/nvim-ts-context-commentstring",
  lazy = true,
  opts = {
    enable_autocmd = false,
  },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      },
    },
  },
}
