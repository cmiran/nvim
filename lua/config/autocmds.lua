vim.api.nvim_create_autocmd("FileType", {
  desc = "quit window with 'q' or 'ESC' on filetype",
  pattern = {
    "checkhealth",
    "help",
    "lspinfo",
    "man",
    "Markdown",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "PlenaryTestPopup",
    "qf",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
    vim.keymap.set(
      "n",
      "<esc>",
      "<cmd>close<cr>",
      { buffer = event.buf, silent = true }
    )
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  desc = "check if we need to reload the file when it changed",
  command = "checktime",
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  desc = "highlight on yank",
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
  desc = "resize splits if window got resized",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "go to last location when opening a buffer",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "wrap and check for spell in text filetypes",
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  desc = "auto create dir when saving a file",
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
--     -- vim.cmd[[highlight Normal guifg=#cdcecf guibg=#131a24]]
--     -- vim.api.nvim_win_set_hl(0, "Normal", { bg = "#131a24" })
--   end,
-- })
