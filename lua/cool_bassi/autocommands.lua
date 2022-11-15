local create_autocmd = vim.api.nvim_create_autocmd

create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "Markdown",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<cr> 
      nnoremap <silent> <buffer> <esc> :close<cr> 
      set nobuflisted 
    ]]
  end,
})

create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set laststatus=0
--     ]]
--   end,
-- })
