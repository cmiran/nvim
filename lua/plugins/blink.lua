---@type LazySpec
return {
  -- "github.com/Saghen/blink.cmp",
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "LspAttach",
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = {
        Copilot = "",
      },
    },
    keymap = {
      preset = "enter",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down" },
      ["<PageUp>"] = { "scroll_documentation_up" },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      menu = {
        draw = {
          columns = {
            { "kind_icon" },
            { "label", "label_description", gap = 1 },
            { "source_name", gap = 1 },
          },
          components = {
            -- kind_icons = {
            --   text = function(ctx)
            --     if ctx.source_name == "Copilot" then
            --       return "" .. ctx.icon_gap
            --     end
            --     return ctx.kind_icon .. ctx.icon_gap
            --   end,
            -- },
            label = {
              width = {
                max = 30,
              },
            },
          },
          treesitter = { "lsp" },
        },
      },
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          async = true,
          -- fallbacks = {},
        },
      },
    },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
    -- require("blink.cmp.snippets").load_friendly_snippets()

    -- NvimTree: set_win_config to not throw error when window is closed
    vim.api.nvim_create_autocmd("User", {
      pattern = "BlinkReady",
      callback = function()
        local ok, window = pcall(require, "blink.cmp.lib.window")
        if not ok then return end

        local orig = window.set_win_config
        window.set_win_config = function(self, config)
          if self.win and vim.api.nvim_win_is_valid(self.win) then
            return orig(self, config)
          end
        end
      end,
    })
  end,
}
