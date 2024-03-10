return {
  "dstein64/vim-startuptime",
  cmd = "StartupTime",
  config = function()
    vim.g.startuptime_tries = 10

    vim.api.nvim_create_autocmd("FileType", {
      desc = "hide line numbers and color column for startuptime",
      pattern = { "startuptime" },
      callback = function()
        vim.o.number = false
        vim.o.relativenumber = false
        vim.o.colorcolumn = ""
      end,
    })
  end,
}
