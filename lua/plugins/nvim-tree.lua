local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local keymap = require("util").keymap
  local wk = require("which-key")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr }
  end

  api.config.mappings.default_on_attach(bufnr)

  keymap("n", "l", api.node.open.edit, opts("Open"))
  keymap("n", "<CR>", api.node.open.edit, opts("Open"))
  keymap("n", "o", api.node.open.edit, opts("Open"))
  keymap("n", "w", api.node.navigate.parent_close, opts("Close directory"))
  keymap("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  keymap("n", "<ESC>", api.tree.close, opts("Close"))
  keymap("n", " ",
    function()
      api.tree.close()
      wk.show({ keys = "<Leader>" })
    end,
    opts("WhichKey")
  )
end

local function win_config()
  return {
    relative = "editor",
    border = "shadow",
    width = math.floor(vim.o.columns * 0.4),
    height = math.floor(vim.o.lines * 0.7),
    row = 6,
    col = math.floor(vim.o.columns * 0.565),
  }
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
    { "<leader>e", "<cmd>NvimTreeToggle<cr>",    desc = "Tree" },
    { "<leader>m", "<cmd>NvimTreeOpen /tmp<cr>", desc = "Tree /tmp" },
  },
  opts = {
    on_attach = on_attach,
    disable_netrw = true,
    sync_root_with_cwd = true,
    view = {
      preserve_window_proportions = true,
      float = {
        enable = true,
        open_win_config = win_config
      },
    },
    renderer = {
      highlight_git = true,
      root_folder_modifier = ":t", -- ":~:s?$?/..?"
      indent_markers = {
        enable = false,
        icons = {
          corner = "│",
        },
      },
      icons = {
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
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        local view = require("nvim-tree.view")
        if not view.is_visible() then return end

        local win = view.get_winnr()
        if not vim.api.nvim_win_is_valid(win) then return end

        pcall(vim.api.nvim_win_set_config, win, win_config())
      end,
    })

    require("nvim-tree").setup(opts)
  end,
}
