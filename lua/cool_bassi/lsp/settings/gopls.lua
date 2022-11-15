return {
  cmd = {
    "gopls"
  },
  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl",
  },
  root_dir = require("lspconfig").util.root_pattern("go.mod", ".git"),
  single_file_support = true,
}

