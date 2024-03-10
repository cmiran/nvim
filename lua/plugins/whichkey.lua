-- github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        g = false, -- bindings for prefixed with g
        z = false, -- bindings for prefixed with z
      },
      spelling = true,
    },
    window = {
      border = "shadow",
      position = "top",
      margin = { 2, 6, 0, 6 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left],
    },
    layout = {
      height = { min = 7 }, -- min and max height of the columns
    },
    disable = {
      filetypes = {
        "help",
        "NvimTree",
        "TelescopePrompt",
      },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    local defaults = {
      mode = { "n", "v" },
      nowait = true,
    }
    local groups = {
      ["<leader>"] = {
        name = "leader",
        ["\\"] = { name = "terminal" },
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
        },
        s = {
          name = "search",
          n = { name = "noice" },
        },
        t = { name = "test" },
        u = { name = "ui" },
        x = { name = "extra" },
      },
      ["["] = { name = "goto prev" },
      ["]"] = { name = "goto next" },
      ["<C-w>"] = { name = "window" },
      g = { name = "action" },
    }

    wk.setup(opts)
    wk.register(groups, defaults)
  end,
}
