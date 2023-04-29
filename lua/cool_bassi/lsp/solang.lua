return {
  cmd = {
    "solang",
    "language-server",
    "--target",
    "evm",
  },
  filetypes = {
    "solidity",
  },
  root_dir = require("lspconfig").util.find_git_ancestor,
}
