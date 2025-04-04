---@type vim.lsp.Config
return {
  cmd = { 'yaml-language-server', '--stdio' },
  filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab' },
  settings = {
    -- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
    redhat = {
      telemetry = {
        enabled = false
      }
    },
    yaml = {
      schemaStore = { enable = true },
      keyOrdering = false,
    },
  },
}
