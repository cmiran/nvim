local function get_popup_position()
  local win_height = vim.api.nvim_get_option("lines")
  return win_height / 2.7
end

return {
  -- github.com/folke/noice.nvim
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    lsp = {
      override = {
        -- override the default lsp markdown formatter with Noice
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        -- override the lsp markdown formatter with Noice
        ["vim.lsp.util.stylize_markdown"] = true,
        -- override cmp documentation with Noice (needs the other options to work)
        ["cmp.entry.get_documentation"] = true,
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = false,
      inc_rename = true,
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 1 },
        },
        position = {
          row = get_popup_position(),
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder"
          },
        },
      },
      cmdline_popupmenu = {
        border = {
          style = "none",
          padding = { 0, 1, 1, 1 },
        },
        position = {
          row = get_popup_position() + 3,
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder"
          },
        },
      },
      popupmenu = {
        border = {
          style = "none",
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder"
          },
        },
      },
      popup = {
        border = {
          style = "none",
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder"
          },
        },
      },
    },
  },
  keys = {
    {
      "<S-Enter>",
      function() require("noice").redirect(vim.fn.getcmdline()) end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
    {
      "<leader>snl",
      function() require("noice").cmd("last") end,
      desc = "Noice Last Message",
    },
    {
      "<leader>snh",
      function() require("noice").cmd("history") end,
      desc = "Noice History"
    },
    {
      "<leader>sna",
      function() require("noice").cmd("all") end,
      desc = "Noice All"
    },
    {
      "<leader>snd",
      function() require("noice").cmd("dismiss") end,
      desc = "Dismiss All"
    },
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then return "<c-f>" end
      end,
      silent = true,
      expr = true,
      desc = "Scroll forward",
      mode = { "i", "n", "s" }
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then return "<c-b>" end
      end,
      silent = true,
      expr = true,
      desc = "Scroll backward",
      mode = { "i", "n", "s" }
    },
  },
}
