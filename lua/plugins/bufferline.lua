return {
  -- github.com/akinsho/bufferline.nvim
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    {
      "<leader>bP",
      "<Cmd>BufferLineGroupClose ungrouped<CR>",
      desc = "Delete non-pinned buffers",
    },
  },
  opts = {
    options = {
      buffer_close_icon = "",
      modified_icon = "!",
      -- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      --   local t = {}
      --   for s in string.gmatch(buf.path, "[^/]+") do
      --     table.insert(t, s)
      --   end
      --   if #t == 1 then
      --     return t[0]
      --   else
      --     -- return t[#t-1]:sub(1,1) .. "/" .. t[#t]
      --     return t[#t-1] .. "/" .. t[#t]
      --   end
      --   -- return string.match(buf.path, "[^/]?/?[^/]+$")
      -- end,
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("util").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "",
          padding = 0,
        },
      },
      show_buffer_close_icons = false,
      separator_style = { "", "" },
      enforce_regular_tabs = true,
    },
    -- highlights = {
    --   -- fill = {
    --   --   fg = { attribute = "fg", highlight = "#ff0000" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- background = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- tab = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- tab_selected = {
    --   --   fg = { attribute = "fg", highlight = "Normal" },
    --   --   bg = { attribute = "bg", highlight = "Normal" },
    --   -- },
    --   -- tab_close = {
    --   --   -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
    --   --   fg = { attribute = "fg", highlight = "TabLineSel" },
    --   --   bg = { attribute = "bg", highlight = "Normal" },
    --   -- },
    --   -- close_button = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- close_button_visible = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   buffer_selected = {
    --     italic = false,
    --   },
    --   buffer_visible = {
    --     bold = true,
    --     fg = { attribute = "fg", highlight = "Normal" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   },
    --   -- duplicate_selected = {
    --   --   fg = { attribute = "fg", highlight = "TabLineSel" },
    --   --   bg = { attribute = "bg", highlight = "TabLineSel" },
    --   --   italic = true,
    --   -- },
    --   -- numbers = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   -- },
    --   -- numbers_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   -- },
    --   -- numbers_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = true,
    --   -- },
    --   -- diagnostic = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   -- },
    --   -- diagnostic_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   -- },
    --   -- diagnostic_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = false,
    --   -- },
    --   hint = {
    --     -- fg = { attribute = "fg", highlight = "DiagnosticsHint" },
    --     fg =  "#81b29a"
    --   },
    --   -- hint_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   hint_selected = {
    --     italic = false,
    --   },
    --   -- hint_diagnostic = {
    --   --   fg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- hint_diagnostic_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- hint_diagnostic_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = false,
    --   -- },
    --   info = {
    --     -- fg = { attribute = "fg", highlight = "DiagnosticsInfo" },
    --     fg = "#719cd6"
    --   },
    --   -- info_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   info_selected = {
    --     italic = false,
    --   },
    --   -- info_diagnostic = {
    --   --   fg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- info_diagnostic_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- info_diagnostic_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = false,
    --   -- },
    --   warning = {
    --     -- fg = { attribute = "fg", highlight = "DiagnosticsWarn" },
    --     fg = "#dbc074",
    --   },
    --   -- warning_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   warning_selected = {
    --     italic = false,
    --   },
    --   -- warning_diagnostic = {
    --   --   fg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- warning_diagnostic_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- warning_diagnostic_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   sp = warning_diagnostic_fg
    --   --   bold = true,
    --   --   italic = false,
    --   -- },
    --   error = {
    --     -- fg = { attribute = "fg", highlight = "DiagnosticsError" },
    --     fg = "#c94f6d",
    --   },
    --   -- error_visible = {
    --   --   fg = { attribute = "fg", highlight = "DiagnosticsError" },
    --   -- },
    --   error_selected = {
    --     italic = false,
    --   },
    --   -- error_diagnostic = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>'
    --   -- },
    --   -- error_diagnostic_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>'
    --   -- },
    --   -- error_diagnostic_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   sp = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = false,
    --   -- },
    --   modified = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --   },
    --   modified_selected = {
    --     fg = { attribute = "fg", highlight = "TabLine" },
    --   },
    --   -- modified_visible = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- duplicate_visible = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   --   italic = true,
    --   -- },
    --   -- duplicate = {
    --   --   fg = { attribute = "fg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   --   italic = true,
    --   -- },
    --   -- separator = {
    --   --   fg = { attribute = "bg", highlight = "TabLine" },
    --   --   bg = { attribute = "bg", highlight = "TabLine" },
    --   -- },
    --   -- separator_selected = {
    --   --   fg = { attribute = "bg", highlight = "Normal" },
    --   --   bg = { attribute = "bg", highlight = "Normal" },
    --   -- },
    --   -- separator_visible = {
    --   --   fg = {attribute='bg',highlight='TabLine'},
    --   --   bg = {attribute='bg',highlight='TabLine'}
    --   -- },
    --   -- indicator_selected = {
    --   --   fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
    --   --   bg = { attribute = "bg", highlight = "Normal" },
    --   -- },
    --   -- pick_selected = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = true,
    --   -- },
    --   -- pick_visible = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = true,
    --   -- },
    --   -- pick = {
    --   --   fg = '<colour-value-here>',
    --   --   bg = '<colour-value-here>',
    --   --   bold = true,
    --   --   italic = true,
    --   -- },
    --   -- offset_separator = {
    --   --   fg = win_separator_fg,
    --   --   bg = separator_background_color,
    --   -- },
    -- },
  },
}
