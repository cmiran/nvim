return {
  cmd = { 'solc', '--lsp' },
  filetypes = { 'solidity' },
  root_markers = {
    "hardhat.config.js",
    "hardhat.config.ts",
    "foundry.toml",
    "remappings.txt",
    "truffle.js",
    "truffle-config.js",
    "ape-config.yaml",
  },
}
