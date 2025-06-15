return {
  -- github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- github.com/nvim-treesitter/nvim-treesitter-textobjects
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- github.com/p00f/nvim-ts-rainbow
    "p00f/nvim-ts-rainbow",
  },
  keys = {
    "<Leader>s",
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
        init_selection = "<Leader>s",
        node_incremental = "+",
        scope_incremental = false,
        node_decremental = "_",
      },
    },
    rainbow = {
      enable = false,
      extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
    textobjects = {
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
          ["]a"] = "@parameter.inner",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
          ["]A"] = "@parameter.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
          ["[a"] = "@parameter.inner",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
          ["[A"] = "@parameter.outer",
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
