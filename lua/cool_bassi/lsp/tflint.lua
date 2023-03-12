return {
  cmd = {
    'tflint',
    -- '--config',
    -- os.getenv("HOME") .. '/.config/tflint/tflint.hcl',
    '--langserver',
  },
  filetypes = {
    'terraform',
  },
  -- root_dir = {
  --   root_dir = require('lspconfig').util.root_pattern('.terraform', '.git', '.tflint.hcl'),
  -- },
}
