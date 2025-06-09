return {
  -- github.com/folke/which-key.nvim
  "folke/which-key.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    disable = {
      ft = { "help" },
    },
    plugins = {
      marks = false,
      registers = false,
      spelling = { enabled = false },
      presets = {
        windows = false,
        nav = false,
        g = false,
        z = false,
      },
    },
    win = {
      no_overlap = false,
      width = {
        max = math.max(vim.o.columns*0.40, 25),
      },
      height = {
        min = 0,
        max = math.max(vim.o.lines*0.75, 25),
      },
      row = 6,
      col = 2,
      border = "shadow",
      padding = { 1, 1 }, -- top, right, bottom, left
      wo = {
        wrap = true,
      },
    },
    spec = {
      {
        mode = { "n", "v" },
        { "<C-w>", group = "window", nowait = true },
        { "<leader>", group = "leader", nowait = true },
        { "<leader>a", group = "ai", nowait = true },
        { "<leader>b", group = "buffer", nowait = true },
        { "<leader>c", group = "code", nowait = true },
        { "<leader>cg", group = "go", nowait = true },
        { "<leader>cm", group = "markdown", nowait = true },
        { "<leader>f", group = "find", nowait = true },
        { "<leader>g", group = "git", nowait = true },
        { "<leader>gh", group = "hunk", nowait = true },
        { "<leader>l", group = "lsp", nowait = true },
        { "<leader>y", group = "notification", nowait = true },
        { "<leader>p", group = "plugin", nowait = true },
        { "<leader>s", desc = "Select", nowait = true }, -- override treesitter default description
        { "<leader>t", group = "test", nowait = true },
        { "<leader>u", group = "ui", nowait = true },
        { "[", name = "prev", nowait = true },
        { "]", name = "next", nowait = true },
        { "g", name = "gaction", nowait = true },
        { "a", name = "zaction", nowait = true },
      }
    },
  },
}
