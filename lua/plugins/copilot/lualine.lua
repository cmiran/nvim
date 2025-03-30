return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "copilot.lua",
  opts = function(_, opts)
    local Util = require("util")
    local colors = {
      [""] = Util.fg("DiagnosticOk"),
      ["Normal"] = Util.fg("DiagnosticOk"),
      ["Warning"] = Util.fg("DiagnosticError"),
      ["InProgress"] = Util.fg("DiagnosticWarn"),
    }
    table.insert(opts.sections.lualine_y, 1, {
      function()
        local icon = require("util").icons.kinds.Copilot
        local status = require("copilot.api").status.data
        return icon .. (status.message or "")
      end,
      cond = function()
        local ok, clients =
          pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
        return ok and #clients > 0
      end,
      color = function()
        local status = require("copilot.api").status.data
        return colors[status.status] or colors[""]
      end,
    })
  end,
}
