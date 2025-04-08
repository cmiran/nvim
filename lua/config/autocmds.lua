vim.api.nvim_create_autocmd("FileType", {
  desc = "quit window with 'q' or 'ESC' on filetype",
  pattern = {
    "alpha", -- does not work
    "checkhealth",
    "CodeCompanion",
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

vim.api.nvim_create_autocmd('ModeChanged', {
  desc = "redraw the diagnostics when the mode change",
  group = vim.api.nvim_create_augroup('diagnostic_redraw', {}),
  callback = function()
    pcall(vim.diagnostic.show)
  end
})

-- change background color for help
-- vim.api.nvim_create_autocmd({"FileType", "BufEnter"}, {
--   pattern = { "help" },
--   callback = function()
--     -- vim.cmd[[highlight Normal guifg=#cdcecf guibg=#131a24]]
--     -- vim.api.nvim_win_set_hl(0, "Normal", { bg = "#131a24" })
--   end,
-- })
--

-- reddit.com/r/neovim/comments/1jpbc7s/disable_virtual_text_if_there_is_diagnostic_in/
-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'DiagnosticChanged' }, {
--      group = vim.api.nvim_create_augroup('diagnostic_virt_text_hide', {}),
--   callback = function(ev)
--     local lnum, _ = unpack(vim.api.nvim_win_get_cursor(0))
--     lnum = lnum - 1 -- need 0-based index

--    local hidden_lnum = vim.b[ev.buf].diagnostic_hidden_lnum
--    if hidden_lnum and hidden_lnum ~= lnum then
--      vim.b[ev.buf].diagnostic_hidden_lnum = nil
--      -- display all the decorations if the current line changed
--      vim.diagnostic.show(nil, ev.buf)
--    end

--    for _, namespace in pairs(vim.diagnostic.get_namespaces()) do
--      local ns_id = namespace.user_data.virt_text_ns
--        if ns_id then
--          local extmarks = vim.api.nvim_buf_get_extmarks(ev.buf, ns_id, { lnum, 0 }, { lnum, -1 }, {})
--          for _, extmark in pairs(extmarks) do
--            local id = extmark[1]
--            vim.api.nvim_buf_del_extmark(ev.buf, ns_id, id)
--          end

--          if extmarks and not vim.b[ev.buf].diagnostic_hidden_lnum then
--            vim.b[ev.buf].diagnostic_hidden_lnum = lnum
--         end
--       end
--     end
--   end,
-- })

