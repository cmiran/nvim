return {
  -- github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- github.com/JoosepAlviste/nvim-ts-context-commentstring
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- github.com/p00f/nvim-ts-rainbow
    "p00f/nvim-ts-rainbow",
  },
  keys = {
    { "<c-space>", desc = "Increment selection" },
    { "<bs>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "css",
      "dockerfile",
      "go",
      "gomod",
      "gowork",
      "gosum",
      "graphql",
      "html",
      "java",
      "javascript",
      "json",
      "llvm",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "proto",
      "query",
      "regex",
      "ruby",
      "scss",
      "sql",
      "solidity",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = true, -- Automatically install missing parsers when entering buffer
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
      -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
      -- the name of the parser).
      disable = { "" }, -- list of language that will be disabled
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages.
      additional_vim_regex_highlighting = false,
    },
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    indent = {
      enable = false,
      disable = { "" },
    },
    rainbow = {
      enable = false,
      -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
      extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "<C-space>",
    --     node_incremental = "<C-space>",
    --     scope_incremental = false,
    --     node_decremental = "<bs>",
    --   },
    -- },
    -- refactor = {
    -- highlight_definitions = {
    --   enable = true,
    --   -- Set to false if you have an `updatetime` of ~100.
    --   clear_on_cursor_move = true,
    -- },
    -- highlight_current_scope = { enable = false },
  },
}
