local parsers = {
  "bash",
  "c",
  "cpp",
  "css",
  "go",
  "dockerfile",
  "graphql",
  "html",
  "java",
  "javascript",
  "json",
  "llvm",
  "lua",
  "make",
  "markdown",
  "query",
  "regex",
  "ruby",
  "scss",
  "sql",
  "solidity",
  "typescript",
  "vim",
  "yaml",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = parsers, -- one of "all" or a list of languages
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
    disable = { "" }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {"BufWrite", "CursorHold"},
    },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
})
