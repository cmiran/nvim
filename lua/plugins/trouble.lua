return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble quickfix<cr>",
      desc = "Quickfix List (Trouble)",
    },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
