return {
  enabled = false,
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
      desc = "disable mini.indentscope for certain filetypes",
      pattern = {
        "alpha",
        "help",
        "lazy",
        -- "neo-tree",
        "NvimTree",
        "Noice",
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
