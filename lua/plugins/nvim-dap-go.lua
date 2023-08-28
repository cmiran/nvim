return {
  "leoluz/nvim-dap-go",
  ft = "go",
  dependencies = "mfussenegger/nvim-dap",
  config = function()
    require('dap-go').setup()
  end,
  keys = {
    { "<leader>dagt", function() require("dap-go").debug_test() end, desc = "Debug go test" },
    { "<leader>dagl", function() require("dap-go").debug_last() end, desc = "Debug go last" },
  },
}
