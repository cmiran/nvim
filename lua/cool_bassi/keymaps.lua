local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal_mode: n

-- jump to visible line
keymap("n", "<Down>", "gj", opts)
keymap("n", "<Up>", "gk", opts)

-- navigate between windows with arrows 
keymap("n", "<A-Left>", "<C-w>h", opts)
keymap("n", "<A-Down>", "<C-w>j", opts)
keymap("n", "<A-Up>", "<C-w>k", opts)
keymap("n", "<A-Right>", "<C-w>l", opts)

-- resize windows with <A-kjhl> (macos)
keymap("n", "˙", ":vertical resize +2<CR>", opts)
keymap("n", "∆", ":resize +2<CR>", opts)
keymap("n", "˚", ":resize -2<CR>", opts)
keymap("n", "¬", ":vertical resize -2<CR>", opts)

-- delete buffer!
keymap("n", "D", ":Bdelete!<CR>", opts)

-- navigate buffers
keymap("n", "H", ":bprevious<CR>", opts)
keymap("n", "L", ":bnext<CR>", opts)

-- quit all!
-- keymap("n", "Q", ":qa!<CR>", opts)
-- keymap("n", "<M-tab>", "<C-6>", opts)

-- visual_mode: v

-- "tab" line left and right while staying in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move line up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)

 -- keep copy past memory
keymap("v", "p", '"_dP', opts)

-- visual_block_mode: x

-- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- term_mode: t

-- better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- command_mode: c
-- insert_mode: i
