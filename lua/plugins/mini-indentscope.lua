return {
  -- github.com/echasnovski/mini.indentscope
  "echasnovski/mini.indentscope",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "alpha",
        "help",
        "lazy",
        -- "neo-tree",
        "NvimTree",
        -- "Trouble",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  config = function(_, opts)
    require("mini.indentscope").setup(opts)
  end,
}
