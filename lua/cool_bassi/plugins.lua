-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"

  -- Any-Jump
  -- use  "pechorin/any-jump.vim" -- github.com/pechorin/any-jump.vim

  -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-autopairs" -- github.com/windwp/nvim-autopairs

  -- Bufferline
  use "akinsho/bufferline.nvim" -- github.com/akinsho/bufferline.nvim
  use "moll/vim-bbye" -- github.com/moll/vim-bbye

  -- colorschemes
  use  "~/tender.vim" -- github.com/jacoborus/tender.vim
  use  "EdenEast/nightfox.nvim" -- github.com/EdenEast/nightfox.nvim
  use  "LunarVim/darkplus.nvim" -- github.com/LunarVim/darkplus.nvim 
  use  "folke/tokyonight.nvim" -- github.com/folke/tokyonight.nvim
  use  "catppuccin/nvim" -- github.com/catppuccin/nvim 

  -- CMP
  use "hrsh7th/nvim-cmp" -- github.com/hrsh7th/nvim-cmp
  use "hrsh7th/cmp-buffer" -- github.com/hrsh7th/cmp-buffer
  use "hrsh7th/cmp-path" -- github.com/hrsh7th/cmp-path
  use "hrsh7th/cmp-cmdline" -- github.com/hrsh7th/cmp-cmdline
  use "saadparwaiz1/cmp_luasnip" --github.com/saadparwaiz1/cmp_luasnip
  use "hrsh7th/cmp-nvim-lsp" -- github.com/hrsh7th/cmp-nvim-lsp 
	use "hrsh7th/cmp-nvim-lua" -- github.com/hrsh7th/cmp-nvim-lua

  -- Comment
  use "numToStr/Comment.nvim" -- github.com/numToStr/Comment.nvim 

  -- Fuzzy Finder
  -- use "/usr/local/opt/fzf" -- github.com/junegunn/fzf

  -- Git
  use "lewis6991/gitsigns.nvim" -- github.com/lewis6991/gitsigns.nvim
  -- use { "tpope/vim-fugitive", requires = { "tommcdo/vim-fugitive-blame-ext" } } -- github.com/tpope/vim-fugitive
  -- use { "tommcdo/vim-fugitive-blame-ext", opt = true } -- github.com/tommcdo/vim-fugitive-blame-ext

  -- Go
  -- use { "fatih/vim-go", run = ":GoUpdateBinaries", ft = { "go" } } -- github.com/fatih/vim-go/
  -- use { "jstemmer/gotags", ft = { "go" }, requires = { "preservim/tagbar" } } -- github.com/jstemmer/gotags
  -- use { "preservim/tagbar", opt = true } -- github.com/preservim/tagbar

  -- Lazygit
  use "kdheepak/lazygit.nvim"

  -- Lualine
  use "nvim-lualine/lualine.nvim"

	-- LSP
	use "neovim/nvim-lspconfig" -- github.com/neovim/nvim-lspconfig
  use "williamboman/mason.nvim" -- github.com/williamboman/manson.nvim
  use "williamboman/mason-lspconfig.nvim" -- github.com/williamboman/mason-lspconfig.nvim
	use "jose-elias-alvarez/null-ls.nvim" -- github.com/jose-elias-alvarez/null-ls.nvim

  -- NvimTree
  use 'kyazdani42/nvim-tree.lua' -- github.com/kyazdani42/nvim-tree.lua/
  use 'kyazdani42/nvim-web-devicons' -- github.com/kyazdani42/nvim-web-devicons

  -- Ruby
  -- { use "vim-ruby/vim-ruby", ft = { "rb" } } -- github.com/vim-ruby/vim-ruby

  -- Startify
  use "mhinz/vim-startify" -- github.com/mhinz/vim-startify

  -- Snippet
  use "L3MON4D3/LuaSnip" -- github.com/L3MON4D3/LuaSnip/
  use "rafamadriz/friendly-snippets" -- github.com/rafamadriz/friendly-snippets

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- github.com/nvim-telescope/telescope.nvim/
  use "nvim-telescope/telescope-media-files.nvim" -- github.com/nvim-telescope/telescope-media-files.nvim

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" } -- github.com/nvim-treesitter/nvim-treesitter
  use "p00f/nvim-ts-rainbow" -- github.com/p00f/nvim-ts-rainbow
  use "nvim-treesitter/playground" -- github.com/nvim-treesitter/playground
  use "JoosepAlviste/nvim-ts-context-commentstring" -- github.com/JoosepAlviste/nvim-ts-context-commentstring
  -- use { "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" }

  -- Vim-DevIcons
  use "ryanoasis/vim-devicons" -- github.com/ryanoasis/vim-devicons

  -- Vim-Visual-Multi
  -- use "mg979/vim-visual-multi" --  github.com/mg979/vim-visual-multi

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
