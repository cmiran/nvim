return {
  "numToStr/Comment.nvim",
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    -- github.com/JoosepAlviste/nvim-ts-context-commentstring
    -- "JoosepAlviste/nvim-ts-context-commentstring",
  },
  lazy = false,
  opts = {
    ignore = "^$", -- ignores empty lines
    -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  },
}
