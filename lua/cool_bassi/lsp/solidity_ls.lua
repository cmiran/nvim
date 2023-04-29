return {
  cmd = {
    "solidity-language-server",
    "--stdio",
  },
  filetypes = {
    "solidity",
  },
  root_dir = require("lspconfig").util.root_pattern(".git", "package.json"),
}
