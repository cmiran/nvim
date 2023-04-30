local keys = require("lazy.core.handler").handlers.keys
  local function map(mode, lhs, rhs, opts)
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts = { noremap = true, silent = true, unpack(opts)}
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- remap space as leader key
-- map("", "<Space>", "<Nop>", opts)

-- jump to visible line
map("n", "<Down>", "gj", { desc = "move cursor down" })
map("n", "<Up>", "gk", { desc = "move cursor up" })

-- navigate between windows with arrows 
map("n", "<A-Left>", "<C-w>h", { desc = "go to left window" })
map("n", "<A-Down>", "<C-w>j", { desc = "go to lower window" })
map("n", "<A-Up>", "<C-w>k", { desc = "go to upper window" })
map("n", "<A-Right>", "<C-w>l", { desc = "go to right window" })

-- resize windows with <A-kjhl> (macos)
map("n", "<A-S-Left>", ":vertical resize +2<CR>", { desc = "increase window width" })
map("n", "<A-S-Down>", ":resize +2<CR>", { desc = "increase window height" })
map("n", "<A-S-Up>", ":resize -2<CR>", { desc = "decrease window height" })
map("n", "<A-S-Right>", ":vertical resize -2<CR>", { desc = "decrease window width" })

-- navigate buffers
map("n", "H", ":bprevious<CR>", { desc = "previous buffer" })
map("n", "L", ":bnext<CR>", { desc = "next buffer" })

-- quit all!
map("n", "<leader>Q", ":qa!<CR>", { desc = "quit all!" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "save file" })

-- "tab" line left and right while staying in indent mode
map("v", "<", "<gv", { desc = "indent line" })
map("v", ">", ">gv", { desc = "outdent line" })

-- move line up and down with <A-jk>
map("n", "∆", "<cmd>m .+1<cr>==", { desc = "move down" })
map("n", "˚", "<cmd>m .-2<cr>==", { desc = "move up" })
map("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "∆", ":m '>+1<cr>gv=gv", { desc = "move down" })
map("v", "˚", ":m '<-2<cr>gv=gv", { desc = "move up" })

 -- keep copy past memory
map("v", "p", '"_dP')

-- clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "new file" })

-- show highlight group under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "inspect under cursor" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "location list" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "quickfix list" })

-- better terminal navigation
-- map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_{ desc = "" })
-- map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_{ desc = "" })
-- map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_{ desc = "" })
-- map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_{ desc = "" })
