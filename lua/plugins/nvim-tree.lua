local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local keymap = require("util").keymap

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr }
  end

  api.config.mappings.default_on_attach(bufnr)

  keymap("n", "l", api.node.open.edit, opts("Open"))
  keymap("n", "<CR>", api.node.open.edit, opts("Open"))
  keymap("n", "o", api.node.open.edit, opts("Open"))
  keymap("n", "w", api.node.navigate.parent_close, opts("Close directory"))
  keymap("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
end

return {
  -- github.com/kyazdani42/nvim-tree.lua/
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    -- github.com/kyazdani42/nvim-web-devicons
    "nvim-tree/nvim-web-devicons",
  },
  version = "*",
  cmd = {
    "NvimTreeFindFile",
    "NvimTreeFocus",
    "NvimTreeOpen",
    "NvimTreeToggle",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle tree" },
  },
  opts = function()
    return {
      on_attach = on_attach,
      disable_netrw = true,
      sync_root_with_cwd = true,
      view = {
        side = "left",
        float = {
          enable = true,
          open_win_config = {
            relative = "editor",
            border = "shadow",
            width = 30 + 2,
            height = math.floor(vim.o.lines * 0.7) - 5,
            row = 5,
            col = 2,
          },
        },
      },
      renderer = {
        highlight_git = true,
        root_folder_modifier = ":t", -- ":~:s?$?/..?"
        indent_markers = {
          enable = true,
          icons = { corner = "│" },
        },
        icons = {
          -- git_placement = "after",
          show = {
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
          quit_on_open = true,
          window_picker = {
            chars = "123456789QWERTYUIOPASDFGHJKLZXCVBNM",
          },
        },
      },
      git = {
        ignore = false,
      },
    }
  end,
}
