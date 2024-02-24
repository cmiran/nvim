return {
  -- github.com/nvim-treesitter/nvim-treesitter-context
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    -- github.com/rcarriga/nvim-notify
    "rcarriga/nvim-notify",
  },
  config = true,
  keys = {
    {
      "<leader>ut",
      function()
        local tsc = require("treesitter-context")
        tsc.toggle()
        vim.notify("Toggled Treesitter Context", "info", {
          title = "Option",
        })
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
