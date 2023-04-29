return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    -- github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring"

  },
  opts = {
    ignore = '^$', -- ignores empty lines
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  }
}
