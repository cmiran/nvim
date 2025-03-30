-- github.com/hrsh7th/vscode-langservers-extracted
---@type vim.lsp.Config
return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform" },
}
