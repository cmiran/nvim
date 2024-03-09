return {
  -- github.com/lewis6991/gitsigns.nvim
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      changedelete = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "▎" },
      untracked = { text = "▎" },
      -- delete = { text = "" },
      -- topdelete = { text = "" },
    },
    current_line_blame_opts = { delay = 0 },
    current_line_blame_formatter_opts = { relative_time = false },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      map("n", "]h", gs.next_hunk, "Next hunk")
      map("n", "[h", gs.prev_hunk, "Prev hunk")
      map(
        { "n", "v" },
        "<leader>ghs",
        "<cmd>Gitsigns stage_hunk<cr>",
        "Stage hunk"
      )
      map(
        { "n", "v" },
        "<leader>ghr",
        "<cmd>Gitsigns reset_hunk<cr>",
        "Reset hunk"
      )
      map("n", "<leader>ghS", gs.stage_buffer, "Stage buffer")
      map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo stage hunk")
      map("n", "<leader>ghR", gs.reset_buffer, "Reset buffer")
      map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", gs.blame_line, "Blame line")
      map("n", "<leader>gB", function()
        gs.blame_line({ full = true })
      end, "Full balme")
      map("n", "<leader>gd", gs.diffthis, "Diff this")
      map("n", "<leader>gD", function()
        gs.diffthis("~")
      end, "Diff this ~")
      map(
        { "o", "x" },
        "ih",
        ":<C-U>Gitsigns select_hunk<cr>",
        "Gitsigns select hunk"
      )
    end,
  },
}
