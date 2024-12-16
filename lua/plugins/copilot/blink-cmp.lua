return {
  "saghen/blink.cmp",
  dependencies = {
    "giuxtaposition/blink-cmp-copilot",
  },
  event = "LspAttach",
  opts = {
    appearance = {
      kind_icons = {
        Copilot = "",
      },
    },
    completion = {
      menu = {
        draw = {
          -- components = {
          --   kind_icons = {
          --     text = function(ctx)
          --       if ctx.source_name == "Copilot" then
          --         return "" .. ctx.icon_gap
          --       end
          --       return ctx.kind_icon .. ctx.icon_gap
          --     end,
          --   },
          -- },
          treesitter = { 'lsp', "copilot" },
        },
      },
    },
    sources = {
      completion = {
        enabled_providers = { "copilot" },
      },
      providers = {
        copilot = {
          async = true,
          ellipsis = true,
          name = "Copilot",
          -- kind = "Copilot",
          -- kind_icons = "",
          module = "blink-cmp-copilot",
        },
      },
    },
  },
}