return {
  cmd = {
    "solidity-ls",
    "--stdio",
  },
  filtypes = {
    "solidity",
  },
  root_dir = require("lspconfig").util.root_pattern("package.json", ".git"),
  -- eth-brownie.readthedocs.io/en/stable/config.html
  -- root_dir = require("lspconfig").util.root_pattern("brownies-config.yaml", ".git"),
  -- on_attach = on_attach, -- probably you will need this.
  -- capabilities = capabilities,
  settings = {
    -- example of global remapping
    solidity = {
      includePath = "",
      remapping = {}
    }
  },
}
