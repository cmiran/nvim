return {
  -- github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local icons = require("util").icons
    local Util = require("util")

    return {
      extensions = {
        "lazy",
        "nvim-tree",
        -- "trouble",
      },
      options = {
        -- theme = require("lualine.themes.nightfox"),
        globalstatus = true,
        disabled_filetypes = { statusline = { "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          -- {
          --   "diagnostics",
          --   symbols = {
          --     error = icons.diagnostics.Error,
          --     warn = icons.diagnostics.Warn,
          --     info = icons.diagnostics.Info,
          --     hint = icons.diagnostics.Hint,
          --   },
          -- },
          {
            "filetype",
            icon_only = true,
            separator = "",
            padding = { left = 1, right = 0 },
          },
          {
            "filename",
            path = 1,
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.command.has()
            end,
            color = Util.fg("Statement"),
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"]
                and require("noice").api.status.mode.has()
            end,
            color = Util.fg("Constant"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_y = {
          {
            "progress",
            separator = " ",
            padding = { left = 1, right = 0 },
          },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
    }
  end,
}

-- local hide_in_width = function()
--   return vim.fn.winwidth(0) > 80
-- end
--
-- -- local branch = {
-- --   function()
-- --     local gitsigns_buffer_head = vim.b.gitsigns_head
--
-- --     if gitsigns_buffer_head then
-- --       return gitsigns_buffer_head
-- --     end
-- --   end,
-- --   icon = "",
-- -- }
--
-- local diff = {
--   "diff",
--   colored = true,
--   symbols = { added = "+ ", modified = "~ ", removed = "- " },
--   cond = hide_in_width,
--   source = function()
--     local gitsigns_status = vim.b.gitsigns_status_dict
--
--     if gitsigns_status then
--       return {
--         added = gitsigns_status.added,
--         modified = gitsigns_status.changed,
--         removed = gitsigns_status.removed
--       }
--     end
--   end,
-- }
--
-- local diagnostics = {
--   "diagnostics",
--   sources = { "nvim_lsp" },
--   sections = { "error", "warn", "info" },
--   symbols = { error = " ", warn = " ", info = " " },
--   colored = true,
--   always_visible = false,
-- }
--
-- -- local time = { "os.date('%H:%M')" }
--
-- local filetype = { "filetype", icons_enabled = false }
--
-- local lsp_names = {
--   function()
--     local names = {}
--     local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--     local clients = vim.lsp.get_active_clients()
--
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         table.insert(names, client.name)
--       end
--     end
--
--     if next(names) then
--       return "[" .. table.concat(names, " ") .. "]"
--     end
--
--     return ""
--   end,
--   cond = hide_in_width,
-- }
--
-- lualine.setup {
--   options = {
--     -- theme = theme,
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--     -- disabled_filetypes = { "alpha" },
--     always_divide_middle = true,
--     globalstatus = true,
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch" }, -- { {'b:gitsigns_head', icon = ''}, },
--     lualine_c = { diff }, -- { {'diff', source = diff_source} }
--     lualine_x = { diagnostics, filetype, lsp_names },
--     lualine_y = { "progress" },
--     lualine_z = {},
--   },
--   extensions = {}
-- }
