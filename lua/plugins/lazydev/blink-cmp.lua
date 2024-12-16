return {
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
      completion = {
        enabled_providers = { "lazydev" },
        -- enabled_providers = function(ctx)
        --   if vim.bo.filetype == "lua" then
        --     return { "lazydev" }
        --   end
        --   return {}
        -- end,
      },
      providers = {
        lazydev = {
          async = true,
          name = "LazyDev",
          module = "lazydev.integrations.blink",
        },
      },
    },
  },
}
