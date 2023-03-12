local which_key = require("which-key")

local setup = {
  plugins = {
    marks = false, -- shows a list of your marks on ' and `
    registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  window = {
    position = "top",
    margin = { 1, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 2 }, -- min and max height of the columns
  },
  disable = {
    filetypes = {
      "help",
      -- "NvimTree",
      "TelescopePrompt",
    },
  },
  defaults = {
    layout_config = {
      vertical = { height = 1.5 }
    },
  },
}

local n_opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,
  noremap = true,
  nowait = true,
}

local n_mappings = {
  a = { ":Alpha<cr>", "alpha" },
  b = {
    ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer=false})<cr>",
    "buffers",
  },
  D = { ":Bdelete<cr>", "delete buffer" },
  e = { ":NvimTreeToggle<cr>", "tree" },
  f = {
    ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>",
    "find files",
  },
  r = {
    ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>",
    "recent files",
  },
  Q = { ":qa!<cr>", "quit all!" },
  G = {
    ":lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({grep_open_files=true,hidden=true}))<cr>",
  "grep",
},
  w = { ":w<cr>", "save" },
  -- ["P"] = { ":Telescope projects<cr>", "Projects" },

  -- d = {
  --   name = "Debug",
  --   R = { ":lua require('dap').run_to_cursor()<cr>", "Run to Cursor" },
  --   E = { ":lua require('dapui').eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
  --   C = { ":lua require('dap').set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
  --   U = { ":lua require('dapui').toggle()<cr>", "Toggle UI" },
  --   b = { ":lua require('dap').step_back()<cr>", "Step Back" },
  --   c = { ":lua require('dap').continue()<cr>", "Continue" },
  --   d = { ":lua require('dap').disconnect()<cr>", "Disconnect" },
  --   e = { ":lua require('dapui').eval()<cr>", "Evaluate" },
  --   g = { ":lua require('dap').session()<cr>", "Get Session" },
  --   h = { ":lua require('dap.ui.widgets').hover()<cr>", "Hover Variables" },
  --   S = { ":lua require('dap.ui.widgets').scopes()<cr>", "Scopes" },
  --   i = { ":lua require('dap').step_into()<cr>", "Step Into" },
  --   o = { ":lua require('dap').step_over()<cr>", "Step Over" },
  --   p = { ":lua require('dap').pause.toggle()<cr>", "Pause" },
  --   q = { ":lua require('dap').close()<cr>", "Quit" },
  --   r = { ":lua require('dap').repl.toggle()<cr>", "Toggle Repl" },
  --   s = { ":lua require('dap').continue()<cr>", "Start" },
  --   t = { ":lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  --   x = { ":lua require('dap').terminate()<cr>", "Terminate" },
  --   u = { ":lua require('dap').step_out()<cr>", "Step Out" },
  -- },

  g = {
    name = "Git",
    g = { ":lua _LAZYGIT_TOGGLE()<cr>", "lazygit" },
    b = {
      ":lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      "list branch(es)"
    },
    c = {
      ":lua require('telescope.builtin').git_commits(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      "list commit(s)"
    },
    d = { ":Gitsigns diffthis HEAD<cr>", "diff" },
    f = {
      ":lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown())<cr>",
      "list changed file(s)"
    },
    j = { ":lua require('gitsigns').next_hunk()<cr>", "next hunk" },
    k = { ":lua require('gitsigns').prev_hunk()<cr>", "prev hunk" },
    l = { ":lua require('gitsigns').blame_line()<cr>", "blame" },
    p = { ":lua require('gitsigns').preview_hunk()<cr>", "preview hunk" },
    r = { ":lua require('gitsigns').reset_hunk()<cr>", "reset hunk" },
    R = { ":lua require('gitsigns').reset_buffer()<cr>", "reset buffer" },
    s = { ":lua require('gitsigns').stage_hunk()<cr>", "stage hunk" },
    u = { ":lua require('gitsigns').undo_stage_hunk()<cr>", "undo stage hunk" },
  },

  l = {
    name = "LSP",
    a = { ":lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { ":Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
    w = { ":Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
    f = { ":lua vim.lsp.buf.format()<cr>", "Format" },
    i = { ":LspInfo<cr>", "Info" },
    I = { ":LspInstallInfo<cr>", "Installer Info" },
    j = { ":lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    k = { ":lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { ":lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { ":lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { ":lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { ":Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { ":Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },

  n = {
    name = "Notification",
    d = { ":lua require('notify').dismiss()<cr>", "Clear Notification(s)" },
    h = {
      ":lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      "History"
    },
  },

  p = {
    name = "Packer",
    c = { ":PackerCompile<cr>", "Compile" },
    i = { ":PackerInstall<cr>", "Install" },
    s = { ":PackerSync<cr>", "Sync" },
    S = { ":PackerStatus<cr>", "Status" },
    u = { ":PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "Search",
    l = {
      ":lua require('telescope.builtin').highlights(require('telescope.themes').get_dropdown({previewer=top,layout_strategy='vertical',layout_config={height=0.8}}))<cr>",
      "highlights"
    },
    c = { ":Telescope colorscheme<cr>", "Colorscheme" },
    h = { ":Telescope help_tags<cr>", "Find Help" },
    M = { ":Telescope man_pages<cr>", "Man Pages" },
    r = { ":Telescope oldfiles<cr>", "Open Recent File" },
    R = { ":Telescope registers<cr>", "Registers" },
    k = { ":Telescope keymaps<cr>", "Keymaps" },
    C = { ":Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "Vim-Test",
    a = { ":TestSuite<cr>", "all" },
    c = { ":TestClass<cr>", "under cursor" },
    g = { ":TestVisit<cr>", "go to last"},
    l = { ":TestLast<cr>", "run last"},
    t = { ":TestNearest<cr>", "near cursor" },
    T = { ":TestFile<cr>", "all file" },
  },

  ['\\'] = {
    name = "Terminal",
    f = { ":ToggleTerm direction=float<cr>", "float" },
    g = { ":lua _LAZYGIT_TOGGLE()<cr>", "lazygit" },
    h = { ":ToggleTerm size=10 direction=horizontal<cr>", "horizontal" },
    l = { ":lua _LUA_TOGGLE_TOGGLE()<cr>", "python" },
    t = { ":lua _HTOP_TOGGLE()<cr>", "htop" },
    u = { ":lua _NCDU_TOGGLE()<cr>", "ncdu" },
    v = { ":ToggleTerm size=60 direction=vertical<cr>", "vertical split" },
  },
}

local v_opts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local v_mappings = {
  ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
}

which_key.setup(setup)
which_key.register(n_mappings, n_opts)
which_key.register(v_mappings, v_opts)
