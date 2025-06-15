local keymap = require("util").keymap
-- remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)

-- jump to visible line
keymap("n", "<Down>", "gj", { desc = "Move cursor down" })
keymap("n", "<Up>", "gk", { desc = "Move cursor up" })

-- navigate between windows with arrows
keymap("n", "<A-Left>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<A-Down>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<A-Up>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<A-Right>", "<C-w>l", { desc = "Go to right window" })

-- resize windows with <A-kjhl> (macos)
keymap(
  "n",
  "<A-S-Left>",
  ":vertical resize +2<CR>",
  { desc = "Increase window width" }
)
keymap("n", "<A-S-Down>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<A-S-Up>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap(
  "n",
  "<A-S-Right>",
  ":vertical resize -2<CR>",
  { desc = "Decrease window width" }
)

-- navigate buffers
keymap("n", "H", ":bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "L", ":bnext<CR>", { desc = "Next buffer" })

--new temp file
keymap("n", "<leader>n", ":e /tmp/", { desc = "New temp file" })

-- save file
keymap(
  { "i", "v", "n", "s" },
  "<C-s>",
  "<cmd>w<cr><esc>",
  { desc = "Save file" }
)

-- "tab" line left and right while staying in indent mode
keymap("v", "<", "<gv", { desc = "Indent line" })
keymap("v", ">", ">gv", { desc = "Outdent line" })

-- move line up and down with <A-jk>
keymap("n", "∆", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap("n", "˚", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap("i", "∆", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap("i", "˚", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap("v", "∆", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap("v", "˚", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- keep copy past memory
keymap("v", "p", '"_dP', {})

-- clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear hlsearch" })

-- show highlight group under cursor
keymap("n", "<leader>ui", vim.show_pos, { desc = "Inspect under cursor" })

local function beautify_json()
  -- vim.cmd("redir => g:_command_output | silent " .. cmd .. " | redir END ")
  vim.cmd("silent !jq < %")
  if vim.v.shell_error == 0 then
    vim.cmd("%!jq '.'")
  end
end
keymap("n", "<leader>cb", function() beautify_json() end, { desc = "Beautify JSON" })

-- better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_{ desc = "" })
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_{ desc = "" })
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_{ desc = "" })
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_{ desc = "" })
