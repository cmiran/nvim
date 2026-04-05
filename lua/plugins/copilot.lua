return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    suggestion = {
      auto_trigger = true,
      enabled = false,
    },
    panel = {
      enabled = false,
    },
    filetype = {
      yaml = true,
      markdown = true,
    },
  },
  dependencies = {
    {
      "saghen/blink.cmp",
      dependencies = {
        "giuxtaposition/blink-cmp-copilot",
      },
      opts = {
        appearance = {
          kind_icons = {
            Copilot = "",
          },
        },
        completion = {
          menu = {
            draw = {
              treesitter = { "copilot" },
            },
          },
        },
        sources = {
          default = { "copilot" },
          providers = {
            copilot = {
              async = true,
              name = "Copilot",
              module = "blink-cmp-copilot",
            },
          },
        },
      },
    },
  },
}
