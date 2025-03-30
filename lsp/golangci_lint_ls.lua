---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  filetypes = {
    "go",
    "gomod",
    "gosum",
  },
  init_options = {
    command = { 'golangci-lint', 'run', '--out-format', 'json' },
  },
  root_markers = {
    ".golangci.yml",
    ".golangci.yaml",
    ".golangci.toml",
    ".golangci.json",
    "go.mod",
    "go.sum",
    "go.work",
  },
}
