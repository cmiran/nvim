return {
  -- github.com/lukas-reineke/indent-blankline.nvim
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- char = "▏",
    char = "│",
    filetype_exclude = {
      "checkhealth",
      "alpha",
      "help",
      "lazy",
      "lspinfo",
      "man",
      "NvimTree",
      "",
      -- "neo-tree",
      -- "neogitstatus",
      -- "text",
      -- "Trouble",
    },
    show_trailing_blankline_indent = false,
    show_current_context = false,
    use_treesitter = true,
    use_treesitter_scope = true,
  },
}
