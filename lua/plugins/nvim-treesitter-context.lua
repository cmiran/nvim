return {
  -- github.com/nvim-treesitter/nvim-treesitter-context
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    -- github.com/rcarriga/nvim-notify
    -- "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  -- opts = function()
  --   local tsc = require("treesitter-context")
  --   Snacks.toggle({
  --     name = "treesitter context",
  --     get = tsc.enabled,
  --     set = function(state)
  --       if state then
  --         tsc.enable()
  --       else
  --         tsc.disable()
  --       end
  --     end,
  --   }):map("<leader>ut")
  --   return { mode = "cursor", max_lines = 3 }
  -- end,
  opts = {}
}
