return {
  "olexsmir/gopher.nvim",
  build = ":GoInstallDeps",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "go",
  opts = {
    commands = {
      gotests = "~/.go/bin/gotests",
    },
  },
}
