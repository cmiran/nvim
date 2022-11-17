return {
  cmd = {
    "srb",
    "tc",
    "--lsp",
    "--disable-watchman",
  },
  filetypes = {
    "ruby",
  },
  root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
  -- settings = {},
}

