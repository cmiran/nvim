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
      modified_icon = "!",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        local icons = require("util").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      -- enforce_regular_tabs = false,
      numbers = function(opts)
        return string.format('%s', opts.raise(opts.id))
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
    },
  },
}
