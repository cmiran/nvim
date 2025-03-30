-- github.com/golang/tools/tree/master/gopls
---@type vim.lsp.Config
return {
  cmd = { "gopls" },
  filetypes = {
    "go",
    "gomod",
    "gosum",
    "gowork",
    "gotmpl",
  },
  root_markers = {
    "go.mod",
    "go.sum",
  },
  settings = {
    gopls = {
      analyses = {
        fieldalignment = true,
        inferTypeArgs = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-node_modules",
      },
      completeUnimported = true,
      gofumpt = true,
      semanticTokens = true,
      staticcheck = true,
      usePlaceholders = true,
    },
  },
}
