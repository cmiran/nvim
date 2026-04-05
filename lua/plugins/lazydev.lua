return {
  "folke/lazydev.nvim",
  ft = "lua",
  cmd = "LazyDev",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "lazy.nvim", words = { "lazy" } },
    },
  },
  dependencies = {
    {
      "saghen/blink.cmp",
      opts = {
        completion = {
          menu = {
            draw = {
              treesitter = { "lazydev" },
            },
          },
        },
        sources = {
          default = { "lazydev" },
          providers = {
            lazydev = {
              async = true,
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },
      },
    },
  },
}
