require("neotest").setup({
  adapters = {
    require("neotest-go"),
    -- require("neotest-vim-test")({
    --   ignore_file_types = { "python", "vim", "lua" },
    -- }),
  },
})
