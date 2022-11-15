require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator = {
      -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = "none", -- | 'icon' | 'underline' | 'none'
    },
    buffer_close_icon = "",
    modified_icon = "!",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    -- name_formatter can be used to change the buffer's label in the bufferline.
    -- Please note some names can/will break the
    -- bufferline so use this at your discretion knowing that it has
    -- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      local t = {}
      for s in string.gmatch(buf.path, "[^/]+") do
        table.insert(t, s)
      end

      if #t == 1 then
        return t[0]
      else
        -- return t[#t-1]:sub(1,1) .. "/" .. t[#t]
        return t[#t-1] .. "/" .. t[#t]
      end
      -- return string.match(buf.path, "[^/]?/?[^/]+$")
    end,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    -- diagnostics_indicator = function(count, _, diagnostics_dict, _)
    --   if count == 0 then
    --     return
    --   end

    --   for e, n in pairs(diagnostics_dict) do
    --     if e == "error" then
    --       return "  " .. n
    --     elseif e == "warning" then
    --       return "  " .. n
    --     else
    --       return "  " .. n
    --     end
    --   end
    -- end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        padding = 0,
      },
    },
    color_icons = true,
    show_buffer_icons = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = {"", ""}, -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    -- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
    --   -- add custom logic
    --   return buffer_a.modified > buffer_b.modified
    -- end
  },
  highlights = {
    -- fill = {
    --   fg = { attribute = "fg", highlight = "#ff0000" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- background = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- tab = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- tab_selected = {
    --   fg = { attribute = "fg", highlight = "Normal" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    -- tab_close = {
    --   -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
    --   fg = { attribute = "fg", highlight = "TabLineSel" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    -- close_button = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- close_button_visible = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    buffer_selected = {
      italic = false,
    },
    buffer_visible = {
      bold = true,
      fg = { attribute = "fg", highlight = "Normal" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    },
    -- duplicate_selected = {
    --   fg = { attribute = "fg", highlight = "TabLineSel" },
    --   bg = { attribute = "bg", highlight = "TabLineSel" },
    --   italic = true,
    -- },
    -- numbers = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    -- },
    -- numbers_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    -- },
    -- numbers_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   bold = true,
    --   italic = true,
    -- },
    -- diagnostic = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    -- },
    -- diagnostic_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    -- },
    -- diagnostic_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   bold = true,
    --   italic = false,
    -- },
    hint = {
      -- fg = { attribute = "fg", highlight = "DiagnosticsHint" },
      fg =  "#81b29a"
    },
    -- hint_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    hint_selected = {
      italic = false,
    },
    -- hint_diagnostic = {
    --   fg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- hint_diagnostic_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- hint_diagnostic_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bold = true,
    --   italic = false,
    -- },
    info = {
      -- fg = { attribute = "fg", highlight = "DiagnosticsInfo" },
      fg = "#719cd6"
    },
    -- info_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    info_selected = {
      italic = false,
    },
    -- info_diagnostic = {
    --   fg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- info_diagnostic_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- info_diagnostic_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bold = true,
    --   italic = false,
    -- },
    warning = {
      -- fg = { attribute = "fg", highlight = "DiagnosticsWarn" },
      fg = "#dbc074",
    },
    -- warning_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    warning_selected = {
      italic = false,
    },
    -- warning_diagnostic = {
    --   fg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- warning_diagnostic_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- warning_diagnostic_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   sp = warning_diagnostic_fg
    --   bold = true,
    --   italic = false,
    -- },
    error = {
      -- fg = { attribute = "fg", highlight = "DiagnosticsError" },
      fg = "#c94f6d",
    },
    -- error_visible = {
    --   fg = { attribute = "fg", highlight = "DiagnosticsError" },
    -- },
    error_selected = {
      italic = false,
    },
    -- error_diagnostic = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   sp = '<colour-value-here>'
    -- },
    -- error_diagnostic_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>'
    -- },
    -- error_diagnostic_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   sp = '<colour-value-here>',
    --   bold = true,
    --   italic = false,
    -- },
    modified = {
      fg = { attribute = "fg", highlight = "TabLine" },
    },
    modified_selected = {
      fg = { attribute = "fg", highlight = "TabLine" },
    },
    -- modified_visible = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- duplicate_visible = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    --   italic = true,
    -- },
    -- duplicate = {
    --   fg = { attribute = "fg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    --   italic = true,
    -- },
    -- separator = {
    --   fg = { attribute = "bg", highlight = "TabLine" },
    --   bg = { attribute = "bg", highlight = "TabLine" },
    -- },
    -- separator_selected = {
    --   fg = { attribute = "bg", highlight = "Normal" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    -- separator_visible = {
    --   fg = {attribute='bg',highlight='TabLine'},
    --   bg = {attribute='bg',highlight='TabLine'}
    -- },
    -- indicator_selected = {
    --   fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
    --   bg = { attribute = "bg", highlight = "Normal" },
    -- },
    -- pick_selected = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   bold = true,
    --   italic = true,
    -- },
    -- pick_visible = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   bold = true,
    --   italic = true,
    -- },
    -- pick = {
    --   fg = '<colour-value-here>',
    --   bg = '<colour-value-here>',
    --   bold = true,
    --   italic = true,
    -- },
    -- offset_separator = {
    --   fg = win_separator_fg,
    --   bg = separator_background_color,
    -- },
  },
}
