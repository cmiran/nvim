return {
  cmd = {
    "spectral-language-server",
    "--stdio",
  },
  filetypes = {
    "yaml",
    "json",
    "yml",
  },
  root_dir = {
    root_dir = require('lspconfig').util.root_pattern('.git'),
  },
 settings = {
    enable = true,
    run = "onType",
    validateLanguages = {
      "yaml",
      "json",
      "yml",
    },
  },
  single_file_support = true,
}
