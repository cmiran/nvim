---@type vim.lsp.Config
return {
  cmd = { "golangci-lint-langserver" },
  filetypes = {
    "go",
    "gomod",
    "gosum",
  },
  init_options = {
    -- command = { "golangci-lint", "run", "--out-format", "json" },
    command = { "golangci-lint", "run", "--output.json.path=stdout", "--show-stats=false" },
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
