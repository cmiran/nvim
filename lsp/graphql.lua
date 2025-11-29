---@type vim.lsp.Config
return {
  cmd = { 'graphql-lsp', 'server', '-m', 'stream' },
  filetypes = { 'graphql', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
  root_markers = {
    '.graphqlrc',
    '.graphqlrc.yml',
    '.graphqlrc.yaml',
    '.graphqlrc.json',
    '.graphqlrc.js',
    '.graphqlrc.ts',
    '.graphqlrc.toml',
    '.graphql.config.json',
    '.graphql.config.toml',
    '.graphql.config.js',
    '.graphql.config.ts',
    '.graphqlconfig',
  },
}
