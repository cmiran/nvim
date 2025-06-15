return {
  -- github.com/folke/trouble.nvim
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>ld",
      "<cmd>Trouble diagnostics win.position={6,0.98} win.size={width=0.4,height=0.7}<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>lt",
      "<cmd>Trouble lsp_document_symbols win.position={6,0.98} win.size={width=0.4,height=0.7}<cr>",
      desc = "Document symbol tree",
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
      desc = "Prev trouble/quickfix item",
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
  opts = {
    use_diagnostic_signs = true,
    focus = true,
    max_items = 2000,
    ---@type trouble.Window.opts
    win = {
      type = "float",
      border = "shadow",
    }
  },
}
