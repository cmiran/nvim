return {
  -- github.com/folke/which-key.nvim
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = {
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = false, -- adds help for motions
        text_objects = false, -- help for text objects triggered after entering an operator
        g = false, -- bindings for prefixed with g
      },
      spelling = true,
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    window = {
      position = "bottom",
      margin = { 1, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 3 }, -- min and max height of the columns
    },
    disable = {
      filetypes = {
        "help",
        -- "NvimTree",
        "TelescopePrompt",
      },
    },
    defaults = {
      -- layout_config = {
      --   vertical = { height = 1.5 }
      -- },
      mode = { "n", "v" },
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,
      noremap = true,
      nowait = true,
      -- ["P"] = { ":Telescope projects<cr>", "Projects" },
      b = { name = "buffer" },
      c = { name = "code" },
      d = {
        name = "debug",
        a = {
          name = "adapters",
          g = { name = "go" },
        },
      },
      f = { name = "find" },
      g = {
        name = "git",
        h = { name = "hunks" },
        -- g = { ":lua _LAZYGIT_TOGGLE()<cr>", "lazygit" },
      },
      l = {
        name = "LSP",
        a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { ":Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
        w = { ":Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
        f = { ":lua vim.lsp.buf.format()<cr>", "Format" },
        I = { ":LspInstallInfo<cr>", "Installer Info" },
        j = { ":lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        k = { ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { ":lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
      },
      s = {
        name = "search",
        n = { name = "noice" },
      },
      u = { name = "ui" },
      ['\\'] = { name = "terminal" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
