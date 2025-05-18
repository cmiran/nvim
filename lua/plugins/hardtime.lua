return {
  "m4xshen/hardtime.nvim",
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    enabled = false,
  },
  config = function(_, opts)
    local hardtime = require("hardtime")

    Snacks.toggle({
      name = "hardtime",
      get = function()
        return hardtime.is_plugin_enabled
      end,
      set = function(state)
        if state then
          hardtime.enable()
        else
          hardtime.disable()
        end
      end,
    }):map("<leader>ph")

    hardtime.setup(opts)
  end,
}
