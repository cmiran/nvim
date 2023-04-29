local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Find awsome plugins: github.com/rockerBOO/awesome-neovim
require("lazy").setup({
  -- github.com/nvim-lua/plenary.nvim
  'nvim-lua/plenary.nvim',
  -- github.com/nvim-lua/popup.nvim
  'nvim-lua/popup.nvim',

  -- github.com/goolord/alpha-nvim
  'goolord/alpha-nvim',

  -- Autopairs, integrates with both cmp and treesitter
  -- github.com/windwp/nvim-autopairs
  'windwp/nvim-autopairs',

  -- Bufferline
  -- github.com/akinsho/bufferline.nvim
  'akinsho/bufferline.nvim',
  -- github.com/moll/vim-bbye
  'moll/vim-bbye',

  -- colorschemes
  -- github.com/EdenEast/nightfox.nvim
  'EdenEast/nightfox.nvim',
  -- github.com/folke/tokyonight.nvim
  'folke/tokyonight.nvim',
  -- github.com/catppuccin/nvim
  'catppuccin/nvim',
  -- github.com/rebelot/kanagawa.nvim
  'rebelot/kanagawa.nvim',

  -- CMP
  -- github.com/hrsh7th/nvim-cmp
  'hrsh7th/nvim-cmp',
  -- github.com/hrsh7th/cmp-buffer
  'hrsh7th/cmp-buffer',
  -- github.com/hrsh7th/cmp-path
  'hrsh7th/cmp-path',
  -- github.com/hrsh7th/cmp-cmdline
  'hrsh7th/cmp-cmdline',
  --github.com/saadparwaiz1/cmp_luasnip
  'saadparwaiz1/cmp_luasnip',
  -- github.com/hrsh7th/cmp-nvim-lsp
  'hrsh7th/cmp-nvim-lsp',
  -- github.com/hrsh7th/cmp-nvim-lua
  'hrsh7th/cmp-nvim-lua',
  -- github.com/ii14/emmylua-nvim
  'ii14/emmylua-nvim',
  -- github.com/lukas-reineke/cmp-under-comparator
  'lukas-reineke/cmp-under-comparator',

  -- github.com/numToStr/Comment.nvim
 'numToStr/Comment.nvim',

  -- github.com/tamton-aquib/duck.nvim
  -- {
  --   'tamton-aquib/duck.nvim',
  --   config = function()
  --     vim.keymap.set('n -- github.com/lukas-reineke/cmp-under-comparator', '<leader>dd', function() require("duck").hatch() end, {})
  --     vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
  --   end
  -- },

  -- FZF
  -- '/usr/local/opt/fzf', -- github.com/junegunn/fzf

  -- Git
  -- github.com/lewis6991/gitsigns.nvim
 'lewis6991/gitsigns.nvim',
  -- github.com/tpope/vim-fugitive
  -- { 'tpope/vim-fugitive', dependencies = { 'tommcdo/vim-fugitive-blame-ext' } },
  -- github.com/tommcdo/vim-fugitive-blame-ext
  -- { 'tommcdo/vim-fugitive-blame-ext', opt = true },

  -- Go
  -- github.com/fatih/vim-go/
  -- { 'fatih/vim-go', build = ':GoUpdateBinaries', ft = { 'go' } },
  -- github.com/jstemmer/gotags
  -- { 'jstemmer/gotags', ft = { 'go' }, dependencies = { 'preservim/tagbar' } },
  -- github.com/preservim/tagbar
  -- { 'preservim/tagbar', opt = true },

 -- github.com/RRethy/vim-illuminate
 'RRethy/vim-illuminate',

 -- github.com/lewis6991/impatient.nvim
 -- 'lewis6991/impatient.nvim',

  -- github.com/lukas-reineke/indent-blankline.nvim 
 'lukas-reineke/indent-blankline.nvim',

  -- github.com/kdheepak/lazygit.nvim
  -- use 'kdheepak/lazygit.nvim'

  -- github.com/nvim-lualine/lualine.nvim
 'nvim-lualine/lualine.nvim',

 -- LSP
 -- github.com/neovim/nvim-lspconfig
 'neovim/nvim-lspconfig',
 -- github.com/jose-elias-alvarez/null-ls.nvim
 'jose-elias-alvarez/null-ls.nvim',
 -- githu.com/j-hui/fidget.nvim
 'j-hui/fidget.nvim',

  -- github.com/yanskun/gotests.nvim
  {
    'yanskun/gotests.nvim',
    ft = 'go',
    config = function()
      require("gotests").setup()
    end,
  },

  -- https://github.com/iamcco/markdown-preview.nvim
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

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

  -- github.com/rcarriga/nvim-notify
 'rcarriga/nvim-notify',

  --github.com/kyazdani42/nvim-tree.lua/ 
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      -- github.com/kyazdani42/nvim-web-devicons
      'nvim-tree/nvim-web-devicons',
    },
    version = 'nightly',
  },

  -- github.com/vim-ruby/vim-ruby
  -- { use 'vim-ruby/vim-ruby', ft = { 'rb' } }

  -- Snippet
  -- github.com/L3MON4D3/LuaSnip/
  'L3MON4D3/LuaSnip',
  -- github.com/rafamadriz/friendly-snippets
  'rafamadriz/friendly-snippets',

  -- github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      -- github.com/nvim-lua/plenary.nvim
      'nvim-lua/plenary.nvim',

      -- github.com/nvim-telescope/telescope-fzf-native.nvim
      -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

      -- github.com/ANGkeith/telescope-terraform-doc.nvim
      'ANGkeith/telescope-terraform-doc.nvim',

      -- github.com/nvim-telescope/telescope-github.nvim
      -- 'nvim-telescope/telescope-github.nvim',

      -- github.com/nvim-telescope/telescope-media-files.nvim
      -- 'nvim-telescope/telescope-media-files.nvim',
    },
  },

  -- github.com/giusgad/pets.nvim
  -- {
  --   "giusgad/pets.nvim",
  --   dependencies = {
  --     "edluffy/hologram.nvim",
  --     "MunifTanjim/nui.nvim",
  --   }
  -- }

  -- github.com/akinsho/toggleterm.nvim
  { 'akinsho/toggleterm.nvim', version = '*' },

  -- github.com/nvim-treesitter/nvim-treesitter 
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      -- github.com/p00f/nvim-ts-rainbow
      'p00f/nvim-ts-rainbow',

      -- github.com/JoosepAlviste/nvim-ts-context-commentstring
      'JoosepAlviste/nvim-ts-context-commentstring',

      -- github.com/nvim-treesitter/playground
      'nvim-treesitter/playground',
    },
    build = ':TSUpdate',
  },

  -- github.com/vim-test/vim-test
 'vim-test/vim-test',

  -- Vim-Visual-Multi
  -- use 'mg979/vim-visual-multi' --  github.com/mg979/vim-visual-multi

  -- github.com/folke/which-key.nvim 
 'folke/which-key.nvim',

  -- Set up your configuration after cloning packer.nvim.
  -- Put this at the end of startup after all plugins.
})
