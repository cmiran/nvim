-- quit window with 'q' or 'ESC' on filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
    "man",
    "Markdown",
    "notify",
    "PlenaryTestPopup",
    "qf",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    vim.keymap.set("n", "<esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})

-- highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- change background color for help
-- vim.api.nvim_create_autocmd({"FileType", "BufEnter"}, {
--   pattern = { "help" },
--   callback = function()
--     vim.cmd[[highlight Normal guifg=#cdcecf guibg=#131a24]]
--   end,
-- })
