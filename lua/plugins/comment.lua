return {
  "numToStr/Comment.nvim",
  dependencies = {
    -- github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,
  opts = {
    ignore = '^$', -- ignores empty lines
  },
  setup = {
    pre_hook = function()
      return vim.bo.commentstring
    end
  },
}
