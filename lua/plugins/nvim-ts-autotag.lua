return {
  -- github.com/windwp/nvim-ts-autotag
  "windwp/nvim-ts-autotag",
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
  },
  event = { "BufReadPre", "BufNewFile" },
  opts = {},
}
