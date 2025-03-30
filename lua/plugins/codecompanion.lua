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
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanionActions", noremap = true, silent = true },
    { "<leader>aa", "<cmd>CodeCompanionAction<cr>", desc = "Actions" },
    { "<leader>ac", "<cmd>CodeCompanionChat<cr>", desc = "Chat" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" }
    },
  },
  opts = {},
}
