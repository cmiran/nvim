local create_autocmd = vim.api.nvim_create_autocmd

-- Quit window with 'q' or 'ESC' on filetype.
create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "lspinfo",
    "notify",
    "man",
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

-- Reloads neovim whenever you save the plugins.lua file.
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Hide status bar filetype.
-- create_autocmd({ "User" }, {
--   pattern = { "AlphaReady" },
--   callback = function()
--     vim.cmd [[
--       set laststatus=0
--     ]]
--   end,
-- })
