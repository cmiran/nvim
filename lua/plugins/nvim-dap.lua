return {
  "mfussenegger/nvim-dap",
  enabled = false,
  dependencies = {
    -- fancy UI for the debugger
    -- github.com/rcarriga/nvim-dap-ui
    "rcarriga/nvim-dap-ui",

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local Util = require("util")
    vim.api.nvim_set_hl(
      0,
      "DapStoppedLine",
      { default = true, link = "Visual" }
    )

    for name, sign in pairs(Util.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define("Dap" .. name, {
        text = sign[1],
        texthl = sign[2] or "DiagnosticInfo",
        linehl = sign[3],
        numhl = sign[3],
      })
    end
  end,
}
