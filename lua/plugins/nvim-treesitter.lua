local parsers = {
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
}

return {
  -- github.com/nvim-treesitter/nvim-treesitter
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Install missing parsers on startup
    local installed = require("nvim-treesitter.config").get_installed()
    local installed_set = {}
    for _, p in ipairs(installed) do
      installed_set[p] = true
    end
    local to_install = {}
    for _, p in ipairs(parsers) do
      if not installed_set[p] then
        table.insert(to_install, p)
      end
    end
    if #to_install > 0 then
      vim.cmd("TSInstall " .. table.concat(to_install, " "))
    end
  end,
}
