local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  open_on_setup = true,
  sync_root_with_cwd = true,
  view = {
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "w", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t", -- ":~:s?$?/..?"
    indent_markers = {
      enable = true,
      icons = {
        corner = "│",
      },
    },
    icons = {
      -- git_placement = "after",
      show = {
        file = false,
        folder = false,
        git = false,
      },
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  ignore_ft_on_setup = {
    "alpha",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 20,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      window_picker = {
        chars = "123456789QWERTYUIOPASDFGHJKLZXCVBNM",
      },
    },
  },
  git = {
    ignore = false,
  },
}

