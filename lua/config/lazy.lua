local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup(
  {
    { import = "plugins" },
    { import = "plugins.lsp.nvim-lspconfig" },
    { import = "plugins.lsp.null-ls" },
    { import = "plugins.copilot" },

    -- github.com/nvim-neotest/neotest
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-go"
      }
    },
    -- Vim-Visual-Multi
    -- use 'mg979/vim-visual-multi' --  github.com/mg979/vim-visual-multi
  },
  {
    install = {
      colorscheme = { "nightfox" }
    },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
    ui = {
      border = "rounded",
    }
  }
)
