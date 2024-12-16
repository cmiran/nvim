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
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        g = false, -- bindings for prefixed with g
        z = false, -- bindings for prefixed with z
      },
    },
    win = {
      no_overlap = false,
      width = math.min(vim.o.columns - 12, 100),
      col = 6,
      row = 3,
      border = "shadow",
      padding = { 1, 2 }, -- extra window padding [top, right, bottom, left],
      height = { min = 0 },
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
        { "[", name = "goto prev", nowait = true },
        { "]", name = "goto next", nowait = true },
        { "g", name = "action", nowait = true },
      }
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)

    vim.api.nvim_create_autocmd("VimResized", {
      desc = "resize which-key float when resizing the window",
      callback = function()
        local Config = require("which-key.config")
        Config.win.width = math.min(vim.o.columns - 12, 100)
      end,
    })
  end,
}
