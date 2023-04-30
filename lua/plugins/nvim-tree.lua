return {
  -- github.com/kyazdani42/nvim-tree.lua/
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- github.com/kyazdani42/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
  },
  version = 'nightly',
  cmd = {
    "NvimTreeFindFile",
    "NvimTreeFocus",
    "NvimTreeOpen",
    "NvimTreeToggle",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "toggle tree" },
  },
  opts = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    return {
      disable_netrw = true,
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
          icons = { corner = "│" }
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
      git = { ignore = false }
    }
  end,
}
