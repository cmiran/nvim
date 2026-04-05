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
