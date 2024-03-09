return {
  -- github.com/iamcco/markdown-preview.nvim
  "iamcco/markdown-preview.nvim",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
  config = function()
    vim.g.mkdp_auto_close = 0
  end,
}
