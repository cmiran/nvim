local opt = vim.opt

opt.backspace = "2" -- make backspace work like most other programs
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- number of lines to use for the command-line
opt.colorcolumn = "80" -- columns to highlight
-- opt.completeopt = { "menuone" "noselect" }, -- options for Insert mode completion
-- opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.cursorline = true -- highlight the current line
opt.expandtab = true -- convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
-- opt.formatoptions:remove { "cro" } -- TODO: this doesn't seem to work
-- opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = false -- ignore case in search patterns
opt.iskeyword:append '-' -- characters included in keywords
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.number = true -- print the line number in front of each line
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.pumheight = 10 -- maximum height of the popup menu
opt.relativenumber = false -- show relative line number in front of each line
opt.scrolloff = 6 -- minimum nr. of lines above and below cursor
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
-- opt.shortmess:append { 'c' } -- list of flags, reduce length of messages
opt.showmode = false -- message on status line to show current mode
opt.showtabline = 2 -- always show tabs
opt.sidescroll = 1 -- minimum number of columns to scroll horizontal 
opt.sidescrolloff = 0 -- minimum number of columns to left and right of cursor
opt.signcolumn = "yes" -- when and how to display the sign column 
opt.smartcase = true -- no ignore case when pattern has uppercase
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- create a swapfile
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 247 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title = true -- let NeoVim set the title of the window
opt.undofile = true -- save undo information in a file
opt.updatetime = 100 -- faster completion
-- opt.whichwrap:append { '<', '>', '[' , ']', 'h', 'l' } -- allow specified keys to cross line boundaries
opt.wrap = true -- long lines wrap and continue on the next line
opt.writebackup = false -- make a backup before overwriting a file
