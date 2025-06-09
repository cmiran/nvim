return {
  "olexsmir/gopher.nvim",
  build = ":GoInstallDeps",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "go",
  keys = {
    { "<leader>cgd", "<cmd>GoTagAdd db<cr>",   desc = "Add db tag" },
    { "<leader>cge", "<cmd>GoTestsExp<cr>",   desc = "Generate if err" },
    { "<leader>cgE", "<cmd>GoTestsExp<cr>",   desc = "Generate test only exported" },
    { "<leader>cgi", "<cmd>GoTagAdd ion<cr>",  desc = "Add ion tag" },
    { "<leader>cgj", "<cmd>GoTagAdd json<cr>", desc = "Add json tag" },
    { "<leader>cgm", "<cmd>GoMod tidy<cr>",    desc = "Run go mod tidy" },
    { "<leader>cgt", "<cmd>GoTestsAdd<cr>",   desc = "Generate test" },
    { "<leader>cgT", "<cmd>GoTestsAll<cr>",   desc = "Generate all tests" },
    { "<leader>cgy", "<cmd>GoTagAdd yaml<cr>", desc = "Add yaml tag" },
  },
  opts = {
    commands = {
      gotests = "~/.go/bin/gotests",
    },
  },
}
