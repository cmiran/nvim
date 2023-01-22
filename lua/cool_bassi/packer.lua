-- Install and set up packer.nvim on any machine you clone your configuration to.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()
-- Use packer after this line

local packer = require('packer')

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Find awsome plugins: github.com/rockerBOO/awesome-neovim
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- github.com/goolord/alpha-nvim 
  use 'goolord/alpha-nvim'

  -- Autopairs, integrates with both cmp and treesitter
  use 'windwp/nvim-autopairs' -- github.com/windwp/nvim-autopairs

  -- Bufferline
  use 'akinsho/bufferline.nvim' -- github.com/akinsho/bufferline.nvim
  use 'moll/vim-bbye' -- github.com/moll/vim-bbye

  -- colorschemes
  -- use '~/tender.vim' -- github.com/jacoborus/tender.vim
  use 'EdenEast/nightfox.nvim' -- github.com/EdenEast/nightfox.nvim
  use 'LunarVim/darkplus.nvim' -- github.com/LunarVim/darkplus.nvim
  use 'folke/tokyonight.nvim' -- github.com/folke/tokyonight.nvim
  use 'catppuccin/nvim' -- github.com/catppuccin/nvim

  -- CMP
  -- github.com/hrsh7th/nvim-cmp
  use 'hrsh7th/nvim-cmp'
  -- github.com/hrsh7th/cmp-buffer
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path' -- github.com/hrsh7th/cmp-path
  use 'hrsh7th/cmp-cmdline' -- github.com/hrsh7th/cmp-cmdline
  use 'saadparwaiz1/cmp_luasnip' --github.com/saadparwaiz1/cmp_luasnip
  use 'hrsh7th/cmp-nvim-lsp' -- github.com/hrsh7th/cmp-nvim-lsp
  use 'hrsh7th/cmp-nvim-lua' -- github.com/hrsh7th/cmp-nvim-lua
  use 'ii14/emmylua-nvim' -- github.com/ii14/emmylua-nvim
  use 'lukas-reineke/cmp-under-comparator' -- github.com/lukas-reineke/cmp-under-comparator

  -- Comment
  use 'numToStr/Comment.nvim' -- github.com/numToStr/Comment.nvim

  -- FZF
  -- use '/usr/local/opt/fzf' -- github.com/junegunn/fzf

  -- Git
  use 'lewis6991/gitsigns.nvim' -- github.com/lewis6991/gitsigns.nvim
  -- use { 'tpope/vim-fugitive', requires = { 'tommcdo/vim-fugitive-blame-ext' } } -- github.com/tpope/vim-fugitive
  -- use { 'tommcdo/vim-fugitive-blame-ext', opt = true } -- github.com/tommcdo/vim-fugitive-blame-ext

  -- Go
  -- use { 'fatih/vim-go', run = ':GoUpdateBinaries', ft = { 'go' } } -- github.com/fatih/vim-go/
  -- use { 'jstemmer/gotags', ft = { 'go' }, requires = { 'preservim/tagbar' } } -- github.com/jstemmer/gotags
  -- use { 'preservim/tagbar', opt = true } -- github.com/preservim/tagbar

  -- github.com/lewis6991/impatient.nvim 
  use 'lewis6991/impatient.nvim'

  -- github.com/lukas-reineke/indent-blankline.nvim 
  use 'lukas-reineke/indent-blankline.nvim'

  -- Lazygit
  -- use 'kdheepak/lazygit.nvim'

  -- github.com/nvim-lualine/lualine.nvim
  use 'nvim-lualine/lualine.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- github.com/neovim/nvim-lspconfig
  use 'jose-elias-alvarez/null-ls.nvim' -- github.com/jose-elias-alvarez/null-ls.nvim
  -- use 'RRethy/vim-illuminate' -- github.com/RRethy/vim-illuminate

  -- https://github.com/iamcco/markdown-preview.nvim
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- github.com/nvim-neotest/neotest
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go"
    }
  }

  -- github.com/rcarriga/nvim-notify
  use {
    'rcarriga/nvim-notify'
  }

  --github.com/kyazdani42/nvim-tree.lua/ 
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- github.com/kyazdani42/nvim-web-devicons
    },
    tag = 'nightly',
  }

  -- Ruby
  -- { use 'vim-ruby/vim-ruby', ft = { 'rb' } } -- github.com/vim-ruby/vim-ruby

  -- Snippet
  use 'L3MON4D3/LuaSnip' -- github.com/L3MON4D3/LuaSnip/
  use 'rafamadriz/friendly-snippets' -- github.com/rafamadriz/friendly-snippets

  -- github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      -- github.com/nvim-lua/plenary.nvim
      'nvim-lua/plenary.nvim',

      -- github.com/nvim-telescope/telescope-fzf-native.nvim
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },

      -- github.com/ANGkeith/telescope-terraform-doc.nvim
      'ANGkeith/telescope-terraform-doc.nvim',

      -- github.com/nvim-telescope/telescope-github.nvim
      -- 'nvim-telescope/telescope-github.nvim',

      -- github.com/nvim-telescope/telescope-media-files.nvim
      -- 'nvim-telescope/telescope-media-files.nvim',
    },
  }

  -- github.com/akinsho/toggleterm.nvim
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- github.com/nvim-treesitter/nvim-treesitter 
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      -- github.com/p00f/nvim-ts-rainbow
      'p00f/nvim-ts-rainbow',

      -- github.com/JoosepAlviste/nvim-ts-context-commentstring
      'JoosepAlviste/nvim-ts-context-commentstring',

      -- github.com/nvim-treesitter/playground
      'nvim-treesitter/playground',
    },
    run = ':TSUpdate',
  }

  -- github.com/vim-test/vim-test
  use 'vim-test/vim-test'

  -- Vim-Visual-Multi
  -- use 'mg979/vim-visual-multi' --  github.com/mg979/vim-visual-multi

  -- github.com/folke/which-key.nvim 
  use 'folke/which-key.nvim'

  -- Set up your configuration after cloning packer.nvim.
  -- Put this at the end of startup after all plugins.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
