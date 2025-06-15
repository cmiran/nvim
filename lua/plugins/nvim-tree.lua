local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local keymap = require("util").keymap

  local function opts(desc)
    return { desc = desc, buffer = bufnr }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- Default keymaps
  keymap("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
  keymap("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
  keymap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
  keymap("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
  keymap("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
  keymap("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
  keymap("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  keymap("n", "<CR>", api.node.open.edit, opts("Open"))
  keymap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  keymap("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
  keymap("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
  keymap("n", ".", api.node.run.cmd, opts("Run Command"))
  keymap("n", "-", api.tree.change_root_to_parent, opts("Up"))
  keymap("n", "a", api.fs.create, opts("Create File Or Directory"))
  keymap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
  keymap("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
  keymap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
  keymap("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
  keymap("n", "c", api.fs.copy.node, opts("Copy"))
  keymap("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
  keymap("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
  keymap("n", "]c", api.node.navigate.git.next, opts("Next Git"))
  keymap("n", "d", api.fs.remove, opts("Delete"))
  keymap("n", "D", api.fs.trash, opts("Trash"))
  keymap("n", "E", api.tree.expand_all, opts("Expand All"))
  keymap("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
  keymap("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  keymap("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
  keymap("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
  keymap("n", "f", api.live_filter.start, opts("Live Filter: Start"))
  keymap("n", "g?", api.tree.toggle_help, opts("Help"))
  keymap("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  keymap("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
  keymap("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
  keymap("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
  keymap("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
  keymap("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
  keymap("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))
  keymap("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
  keymap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
  keymap("n", "o", api.node.open.edit, opts("Open"))
  keymap("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  keymap("n", "p", api.fs.paste, opts("Paste"))
  keymap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
  keymap("n", "q", api.tree.close, opts("Close"))
  keymap("n", "r", api.fs.rename, opts("Rename"))
  keymap("n", "R", api.tree.reload, opts("Refresh"))
  keymap("n", "s", api.node.run.system, opts("Run System"))
  keymap("n", "S", api.tree.search_node, opts("Search"))
  keymap("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
  keymap("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
  keymap("n", "W", api.tree.collapse_all, opts("Collapse All"))
  keymap("n", "x", api.fs.cut, opts("Cut"))
  keymap("n", "y", api.fs.copy.filename, opts("Copy Name"))
  keymap("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  keymap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  keymap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
  -- Custom keymaps
  keymap("n", "l", api.node.open.edit, opts("Open"))
  keymap("n", "<CR>", api.node.open.edit, opts("Open"))
  keymap("n", "o", api.node.open.edit, opts("Open"))
  keymap("n", "w", api.node.navigate.parent_close, opts("Close directory"))
  keymap("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  keymap("n", "<ESC>", api.tree.close, opts("Close"))
end

local function win_config(height)
  local width = math.floor(vim.o.columns * 0.37)
  return {
    relative = "editor",
    border = "shadow",
    width = width,
    height = math.min(math.floor(vim.o.lines * 0.7), height or math.huge),
    row = 6,
    col = vim.o.columns - width - 2,
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
    require("nvim-tree").setup(opts)

    vim.api.nvim_create_autocmd({ "VimResized", "BufEnter", "BufWinEnter", "WinEnter", "TextChanged", "TextChangedI" }, {
      pattern = "*",
      callback = function()
        local view = require("nvim-tree.view")
        if not view.is_visible() then return end

        local win = view.get_winnr()
        if not win or not vim.api.nvim_win_is_valid(win) then return end

        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if not buf_name:match("NvimTree") then return end

        local line_count = vim.api.nvim_buf_line_count(buf)
        local current_config = vim.api.nvim_win_get_config(win)
        local new_config = vim.tbl_deep_extend("force", current_config, win_config(line_count))
        vim.api.nvim_win_set_config(win, new_config)
      end,
    })
  end,
}
