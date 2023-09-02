return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  dependencies = {
    -- github.com/nvim-lua/plenary.nvim
    "nvim-lua/plenary.nvim",
    -- github.com/nvim-telescope/telescope-fzf-native.nvim
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    -- github.com/nvim-telescope/telescope-github.nvim
    -- 'nvim-telescope/telescope-github.nvim',
  },
  keys = {
    {
      "<leader>fb",
      ":lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer=false})<cr>",
      desc = "Buffers",
    },
    {
      "<leader>ff",
      ":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>",
      desc = "Find files",
    },
    {
      "<leader>fr",
      ":lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({hidden=true,no_ignore=true,previewer=false}))<cr>",
      desc = "Recent files",
    },
    {
      "<leader>gb",
      ":lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      -- mode = {"n", "v"},
      desc = "List branch(es)",
    },
    {
      "<leader>gc",
      ":lua require('telescope.builtin').git_commits(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      -- mode = {"n", "v"},
      desc = "List commit(s)",
    },
    {
      "<leader>gs",
      ":lua require('telescope.builtin').git_status(require('telescope.themes').get_dropdown())<cr>",
      -- mode = {"n", "v"},
      desc = "Status",
    },
    {
      "<leader>sa",
      "<cmd>Telescope autocommands<cr>",
      desc = "Autocommands",
    },
    {
      "<leader>sc",
      "<cmd>Telescope command_history<cr>",
      desc = "Command history",
    },
    {
      "<leader>sC",
      "<cmd>Telescope commands<cr>",
      desc = "Commands",
    },
    {
      "<leader>sd",
      "<cmd>Telescope diagnostics<cr>",
      desc = "Diagnostics",
    },
    {
      "<leader>sh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help",
    },
    {
      "<leader>sH",
      ":lua require('telescope.builtin').highlights(require('telescope.themes').get_dropdown({previewer=top,layout_strategy='vertical',layout_config={height=0.8}}))<cr>",
      desc = "Highlights"
    },
    {
      "<leader>sk",
      "<cmd>Telescope keymaps<cr>",
      desc = "Keymaps",
    },
    {
      "<leader>sn",
      ":lua require('telescope').extensions.notify.notify(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
      desc = "Notifications",
    },
    {
      "<leader>sr",
      "<cmd>Telescope resume<cr>",
      desc = "Resume",
    },
    {
      "<leader>so",
      "<cmd>Telescope vim_options<cr>",
      desc = "Options",
    },
  },
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        border = false,
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        prompt_prefix = " ", -- "> "
        selection_caret = " ", -- "> "
        path_display = { "absolute" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--no-ignore",
          "--hidden",
        },
        mappings = {
          i = {
            ["<C-c>"] = actions.close,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          },
          n = {
            ["<ESC>"] = actions.close,
            ["<C-c>"] = actions.close,
            ["q"] = actions.close,
            ["<Down>"] = actions.move_selection_next,
            ["j"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["k"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["G"] = actions.move_to_bottom,
            ["<CR>"] = actions.select_default,
            ["?"] = actions.which_key,
          },
        },
      },
      -- extensions = {
      --   fzf = {
      --     fuzzy = true,                    -- false will only do exact matching
      --     override_generic_sorter = true,  -- override the generic sorter
      --     override_file_sorter = true,     -- override the file sorter
      --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      --   },
      -- },
    }
  end,
  config = function()
    require("telescope").load_extension("notify")
    -- require("telescope").load_extension("fzf")
  end
}
