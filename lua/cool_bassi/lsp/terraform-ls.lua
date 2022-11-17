return {
  cmd = {
    'terraform-ls',
    -- 'serve',
  },
  filetypes = {
    'terraform',
  },
  root_dir = {
    root_dir = require('lspconfig').util.root_pattern('.terraform', '.git'),
  },
}
