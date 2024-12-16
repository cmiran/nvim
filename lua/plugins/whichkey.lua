-- github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    disable = {
      ft = {
        "help",
        "NvimTree",
        "TelescopePrompt",
      },
    },
    plugins = {
      marks = false,     -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      presets = {
        text_objects = false, -- help for text objects triggered after entering an operator
        -- g = false,
        z = false,
      },
    },
    win = {
      no_overlap = false,
      width = {
        -- min = 0,
        max = math.max(vim.o.columns*0.35, 25),
      },
      height = {
        -- min = 0,
        max = math.max(vim.o.lines*0.5, 25),
        -- max = 0,
      },
      row = 6,
      col = 5,
      border = "shadow",
      padding = { 1, 2 }, -- extra window padding [top, right, bottom, left],
      wo = {
        wrap = true,
      },
    },
    spec = {
      {
        mode = { "n", "v" },
        { "<C-w>", group = "window", nowait = true },
        { "<leader>", group = "leader", nowait = true },
        { "<leader>\\", group = "terminal", nowait = true },
        { "<leader>b", group = "buffer", nowait = true },
        { "<leader>c", group = "code", nowait = true },
        { "<leader>cg", group = "go", nowait = true },
        { "<leader>d", group = "debug", nowait = true },
        { "<leader>dg", group = "go", nowait = true },
        { "<leader>f", group = "find", nowait = true },
        { "<leader>g", group = "git", nowait = true },
        { "<leader>gh", group = "hunks", nowait = true },
        { "<leader>s", group = "search", nowait = true },
        { "<leader>t", group = "test", nowait = true },
        { "<leader>u", group = "ui", nowait = true },
        { "<leader>x", group = "extra", nowait = true },
        { "[", name = "prev", nowait = true },
        { "]", name = "next", nowait = true },
        { "g", name = "action", nowait = true },
      }
    },
  },
}
