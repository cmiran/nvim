return {
  enabled = false,
  -- github.com/lukas-reineke/indent-blankline.nvim
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = {
      -- char = "▏",
      char = "│",
      tab_char = "│",
    },
    scope = {
      show_start = false,
    },
    exclude = {
      filetypes = {
        "checkhealth",
        "alpha",
        "help",
        "lazy",
        "lspinfo",
        "man",
        "NvimTree",
        "notify",
        "Trouble",
        "",
        -- "neo-tree",
        -- "neogitstatus",
        -- "text",
      },
    },
    -- show_trailing_blankline_indent = false,
    -- show_current_context = false,
    -- use_treesitter = true,
    -- use_treesitter_scope = true,
  },
}
