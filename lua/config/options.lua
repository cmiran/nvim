vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- opt.autowrite = true -- enable auto write
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.colorcolumn = "80" -- columns to highlight
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
-- opt.cursorline = true -- highlight the current line
opt.cursorline = false -- highlight the current line
opt.expandtab = true -- convert tabs to spaces
opt.fillchars = { eob = " " } -- characters to use for displaying special items
-- opt.formatoptions:remove { "cro" } -- TODO: this doesn't seem to work
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
-- opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.ignorecase = false -- ignore case in search patterns
opt.iskeyword:append("-") -- characters included in keywords
opt.laststatus = 0
opt.list = true -- show <Tab> and <EOL>
opt.listchars:append("tab:  ") -- characters for displaying in list mode
opt.listchars:append("trail: ")
-- opt.listchars:append "space:."
-- opt.listchars:append "eol:↴"
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.number = true -- print the line number in front of each line
opt.numberwidth = 3 -- set number column width (default 4)
-- opt.pumblend = 10 -- popup blend
opt.pumheight = 10 -- maximum etries in the popup menu
opt.relativenumber = true -- show the line number relative to the line with the cursor in front of each line
opt.scrolloff = 4 -- minimum nr. of lines above and below cursor
opt.shiftround = true -- round indent to multiple of shiftwidth
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- dont show mode since we have a statusline
opt.showtabline = 2 -- always show tabs
opt.signcolumn = "yes" -- when and how to display the sign column
opt.smartcase = true -- no ignore case when pattern has uppercase
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitkeep = "screen"
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- create a swapfile
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 150 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title = true -- let NeoVim set the title of the window
opt.undofile = true -- save undo information in a file
opt.undolevels = 10000
opt.updatetime = 100 -- faster completion
-- opt.whichwrap:append { '<', '>', '[' , ']', 'h', 'l' } -- allow specified keys to cross line boundaries
opt.wildmode = "longest:full,full" -- command-line completion mode
opt.writebackup = false -- make a backup before overwriting a file

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- skip backwards compatibility routines and speed up loading
vim.g.skip_ts_context_commentstring_module = true
