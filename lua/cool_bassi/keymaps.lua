local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- normal
keymap("n", "F","<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts) -- format
-- keymap("n", "<Leader>e", "<cmd>lua require'gitsigns'.reset_buffer()<CR>", opts) -- reset buffer to last commit
-- navigate between windows with arrows 
keymap("n", "<A-Left>", "<C-w>h", opts)
keymap("n", "<A-Down>", "<C-w>j", opts)
keymap("n", "<A-Up>", "<C-w>k", opts)
keymap("n", "<A-Right>", "<C-w>l", opts)
-- keymap("n", "<M-tab>", "<C-6>", opts)
-- resize windows with <A-kjhl>
keymap("n", "˙", ":vertical resize +2<CR>", opts)
keymap("n", "∆", ":resize +2<CR>", opts)
keymap("n", "˚", ":resize -2<CR>", opts)
keymap("n", "¬", ":vertical resize -2<CR>", opts)
-- navigate buffers
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)
keymap("n", "D", ":Bdelete<CR>", opts)
-- move line up and down
-- keymap("n", "J", ":m .+1<CR>==", opts)
-- keymap("n", "K", ":m .-2<CR>==", opts)
keymap("n", "<Esc>", ":noh<CR>", opts) -- toggle search highlight
-- Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- Telescope
keymap("n", "<Leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer=false}))<CR>", opts)
keymap("n", "<Leader>g", "<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({layout_strategy='vertical',layout_config={height=0.80}}))<CR>", opts)
-- keymap("n", "<Leader>gw", "<cmd>lua require('telescope.builtin').grep_string(require('telescope.themes').get_cursor())<CR>", opts)

-- visual
-- "tab" line left and right while staying in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- move line up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- keep copy past memory
-- keymap("v", "<Esc>", ":noh<CR>", opts) -- toggle search highlight

-- visual block
-- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<Esc>", ":noh<CR>", opts) -- toggle search highlight

-- terminal
-- better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

