require('gitsigns').setup {
  signs = {
    add = {
      text = '▎',
    },
    change = {
      text = '▎',
    },
    changedelete = {
      text = '▎',
    },
    delete = {
      text = '▎', -- '契'
    },
    topdelete = {
      text = '▎', -- '契'
    },
  },
  current_line_blame_opts = {
    delay = 0,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
}
