require("indent_blankline").setup {
  filetype_exclude = {
    "checkhealth",
    "alpha",
    "help",
    "lspinfo",
    "man",
    "NvimTree",
    "packer",
    "startify",
    "",
    --[[ "neogitstatus", ]]
    --[[ "text", ]]
    --[[ "Trouble", ]]
  },
  use_treesitter = true,
  use_treesitter_scope = true,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
}
