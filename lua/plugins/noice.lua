local function get_popup_position()
  return vim.o.lines * 0.65
end

local function resize_cmdline_popup()
  local row = get_popup_position()
  local views = require("noice.config").options.views
  views.cmdline_popup.position.row = row
  views.cmdline_popupmenu.position.row = row + 3
  for _, v in ipairs(require("noice.view")._views) do
    if v.opts.view == "cmdline_popup" or v.opts.view == "cmdline_popupmenu" then
      local new_row = v.opts.view == "cmdline_popup" and row or row + 3
      v.view._view_opts.position.row = new_row
      v.view._opts.position.row = new_row
      if v.view._nui then
        v.view._nui:unmount()
        v.view._nui = nil
      end
    end
  end
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
          style = "shadow",
          padding = { 0, 0, 0, 1 },
        },
        position = {
          row = get_popup_position(),
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
      cmdline_popupmenu = {
        border = {
          style = "shadow",
          padding = { 0, 1, 1, 1 },
        },
        position = {
          row = get_popup_position() + 3,
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
      popupmenu = {
        border = {
          style = "shadow",
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
      popup = {
        border = {
          style = "shadow",
        },
        win_options = {
          winhighlight = {
            Normal = "NormalFloat",
            FloatBorder = "FloatBorder",
          },
        },
      },
    },
  },
  keys = {
    {
      "<S-Enter>",
      function()
        require("noice").redirect(vim.fn.getcmdline())
      end,
      mode = "c",
      desc = "Redirect Cmdline",
    },
    {
      "<c-f>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-f>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-b>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-b>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll backward",
      mode = { "i", "n", "s" },
    },
  },
  config = function(_, opts)
    require("noice").setup(opts)

    vim.api.nvim_create_autocmd(
      {
        "VimResized",
        "BufEnter",
        "BufWinEnter",
        "WinEnter",
        "TextChanged",
        "TextChangedI",
      },
      {
        desc = "adapt floating window size on resize or window focus",
        callback = resize_cmdline_popup,
      }
    )
  end,
}
