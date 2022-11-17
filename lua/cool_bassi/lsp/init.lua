local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("cool_bassi.lsp.lspconfig")
require("cool_bassi.lsp.handlers").setup()
require("cool_bassi.lsp.null-ls")
