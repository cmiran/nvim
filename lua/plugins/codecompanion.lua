return {
  enabled = true,
  "olimorris/codecompanion.nvim",
  cmd = {
    'CodeCompanion',
    'CodeCompanionActions',
    'CodeCompanionChat',
    'CodeCompanionCmd',
  },
  keys = {
    { "<C-a>",      "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions", noremap = true, silent = true },
    { "<leader>aa", "<cmd>CodeCompanionAction<cr>",  desc = "Actions" },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>",    desc = "Chat" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    },
  },
  opts = {
    display = {
      chat = {
        window = {
          layout = "float",   -- float|vertical|horizontal|buffer
          -- position = nil,        -- left|right|top|bottom (nil will default depending on vim.opt.splitright|vim.opt.splitbelow)
          border = "shadow",
          -- height = 0.8,
          width = 0.65,
          -- relative = "editor",
          -- full_height = true,   -- when set to false, vsplit will be used to open the chat buffer vs. botright/topleft vsplit
        },
      },
    },
  },
}
