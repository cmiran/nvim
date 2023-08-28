local keymap = require("util").keymap

-- remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- jump to visible line
keymap("n", "<Down>", "gj", { desc = "move cursor down" })
keymap("n", "<Up>", "gk", { desc = "move cursor up" })

-- navigate between windows with arrows 
keymap("n", "<A-Left>", "<C-w>h", { desc = "go to left window" })
keymap("n", "<A-Down>", "<C-w>j", { desc = "go to lower window" })
keymap("n", "<A-Up>", "<C-w>k", { desc = "go to upper window" })
keymap("n", "<A-Right>", "<C-w>l", { desc = "go to right window" })

-- resize windows with <A-kjhl> (macos)
keymap("n", "<A-S-Left>", ":vertical resize +2<CR>", { desc = "increase window width" })
keymap("n", "<A-S-Down>", ":resize +2<CR>", { desc = "increase window height" })
keymap("n", "<A-S-Up>", ":resize -2<CR>", { desc = "decrease window height" })
keymap("n", "<A-S-Right>", ":vertical resize -2<CR>", { desc = "decrease window width" })

-- navigate buffers
keymap("n", "H", ":bprevious<CR>", { desc = "previous buffer" })
keymap("n", "L", ":bnext<CR>", { desc = "next buffer" })

-- quit all!
keymap("n", "<leader>Q", ":qa!<CR>", { desc = "quit all!" })

-- save file
keymap({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "save file" })

-- "tab" line left and right while staying in indent mode
keymap("v", "<", "<gv", { desc = "indent line" })
keymap("v", ">", ">gv", { desc = "outdent line" })

-- move line up and down with <A-jk>
keymap("n", "∆", "<cmd>m .+1<cr>==", { desc = "move down" })
keymap("n", "˚", "<cmd>m .-2<cr>==", { desc = "move up" })
keymap("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap("v", "∆", ":m '>+1<cr>gv=gv", { desc = "move down" })
keymap("v", "˚", ":m '<-2<cr>gv=gv", { desc = "move up" })

 -- keep copy past memory
keymap("v", "p", '"_dP')

-- clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch" })

-- new file
keymap("n", "<leader>fn", "<cmd>enew<cr>", { desc = "new file" })

-- show highlight group under cursor
keymap("n", "<leader>ui", vim.show_pos, { desc = "inspect under cursor" })

keymap("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "location list" })
keymap("n", "<leader>xq", "<cmd>copen<cr>", { desc = "quickfix list" })

-- better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_{ desc = "" })
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_{ desc = "" })
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_{ desc = "" })
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_{ desc = "" })
