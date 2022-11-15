local root_pattern = require("lspconfig").util.root_pattern



return {
  -- cmd = {
  --   "golangci-lint-langserver"
  -- },
  -- init_options = {
  --   command = {
  --     "golangci-lint",
  --     "run",
  --     "--enable-all",
  --     "--out-format",
  --     "json"
  --   },

  -- },
	filetypes = {
    "go",
    "gomod",
  },
  -- root_dir = root_pattern("go.mod", ".golangci.yaml", ".git"),
  -- configs = {
  --   golangcilsp = {
  --     default_config = {
  --       cmd = {
  --         "golangci-lint-langserver"
  --       },
  --       root_dir = require("lspconfig").util.root_pattern("go.mod", ".golangci.yaml", ".git"),
  --       init_options = {
  --         command = {
  --           "golangci-lint",
  --           "run",
  --           "--enable-all",
  --           "--disable",
  --           "lll",
  --           "--out-format",
  --           "json",
  --           "--issues-exit-code=1"
  --         },
  --       },
  --     },
  --   },
  -- },
}

