local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

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
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
  renderer = {
    highlight_git = false,
    root_folder_modifier = ":t", -- :~
    indent_markers = {
      enable = true,
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        git = {
          --[[ unstaged = "", ]]
          --[[ untracked = "U", ]]
        },
      },
    },
  },

  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  actions = {
    open_file = {
      window_picker = {
        chars = "123456789QWERTYUIOPASDFGHJKLZXCVBNM",
      },
    },
  },
}

