return {
  -- github.com/nvim-treesitter/nvim-treesitter-context
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
  },
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    local tsc = require("treesitter-context")

    Snacks.toggle({
      name = "treesitter context",
      get = tsc.enabled,
      set = function(state)
        if state then
          tsc.enable()
        else
          tsc.disable()
        end
      end,
    }):map("<leader>uC")

    tsc.setup(opts)
  end,
}
