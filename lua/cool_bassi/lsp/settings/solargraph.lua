return {
	settings = {
    cmd = {
      "solargraph",
      "stdio"
    },
    filetypes = {
      "ruby",
    },
    flags = {
      debounce_text_changes = 150,
    },
    -- handlers = handlers,
    init_options = {
      formatting = false,
    },
    -- root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
    root_dir = {
      "Gemfile",
      ".git",
      -- ".",
    },
    setting = {
      solargraph = {
        autoformat = true,
        completion = true,
        diagnostic = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true
      }
    }
  },
}

