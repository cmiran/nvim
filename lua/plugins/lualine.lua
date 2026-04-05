return {
  -- github.com/nvim-lualine/lualine.nvim
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local util = require("util")

    return {
      extensions = {
        "lazy",
        "nvim-tree",
        -- "trouble",
      },
      options = {
        globalstatus = true,
        disabled_filetypes = { statusline = { "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            path = 1,
            symbols = { modified = "  ", readonly = "", unnamed = "" },
          },
          {
            "searchcount",
            maxcount = 9999,
            timeout = 500,
          }
        },
        lualine_x = {
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = util.fg("Statement"),
          },
        },
        lualine_y = {},
        lualine_z = {
          { "location", padding = { left = 0, right = 1 } },
        },
      },
    }
  end,
}
