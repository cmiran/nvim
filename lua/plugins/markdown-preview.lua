return {
  -- github.com/iamcco/markdown-preview.nvim
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = "markdown",
  keys = {
    { "<leader>cmp", "<cmd>MarkdownPreview<cr>",   desc = "Preview markdown" },
    { "<leader>cms", "<cmd>MarkdownPreviewStop<cr>",   desc = "Stop markdown preview" },
    { "<leader>cmt", "<cmd>MarkdownPreviewToggle<cr>",   desc = "Toggle markdown preview" },
  },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    vim.g.mkdp_auto_close = 0
  end,
}
