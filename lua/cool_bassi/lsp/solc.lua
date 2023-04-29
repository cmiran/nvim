return {
  cmd = {
    "solc",
    "--lsp",
  },
  filetypes = {
    "solidity",
  },
  root_dir = require("lspconfig").util.root_pattern('hardhat.config.*', '.git'),
}
