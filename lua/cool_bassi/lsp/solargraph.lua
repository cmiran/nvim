return {
  cmd = {
    "solargraph",
    "stdio"
  },
  filetypes = {
    "ruby",
  },
  flags = {
    debounce_text_changes = 150,
  },
  init_options = {
    formatting = true,
  },
  root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      -- commandPath = '/usr/local/Cellar/solargraph/0.45.0/bin/solargraph',
      autoformat = false,
      completion = true,
      diagnostic = false,
      folding = false,
      references = true,
      rename = false,
      symbols = false,
    },
  },
}

