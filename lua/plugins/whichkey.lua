return {
  -- github.com/folke/which-key.nvim
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false,          -- shows a list of your marks on ' and `
      registers = false,      -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      presets = {
        operators = false,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false,      -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        g = false,            -- bindings for prefixed with g
      },
      spelling = true,
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    window = {
      position = "bottom",
      margin = { 1, 0, 0, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 6 }, -- min and max height of the columns
    },
    disable = {
      filetypes = {
        "help",
        -- "NvimTree",
        "TelescopePrompt",
      },
    },
    defaults = {
      -- layout_config = {
      --   vertical = { height = 1.5 }
      -- },
      mode = { "n", "v" },
      prefix = "<leader>",
      nowait = true,
      -- ["P"] = { ":Telescope projects<cr>", "Projects" },
      ['\\'] = { name = "terminal" },
      b = { name = "buffer" },
      c = {
        name = "code",
        g = { name = "go" },
      },
      d = {
        name = "debug",
        g = { name = "go" },
      },
      f = { name = "find" },
      g = {
        name = "git",
        h = { name = "hunks" },
        -- g = { ":lua _LAZYGIT_TOGGLE()<cr>", "lazygit" },
      },
      s = {
        name = "search",
        n = { name = "noice" },
      },
      u = { name = "ui" },
      x = { name = "extra" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")

    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
