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
  opts = {
    auto_install = true,
    sync_install = false,
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
    autopairs = {
      enable = true,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<Leader>cs",
        node_incremental = "+",
        scope_incremental = false,
        node_decremental = "-",
      },
    },
    rainbow = {
      enable = false,
      extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    -- refactor = {
    -- highlight_definitions = {
    --   enable = true,
    --   -- Set to false if you have an `updatetime` of ~100.
    --   clear_on_cursor_move = true,
    -- },
    -- highlight_current_scope = { enable = false },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
